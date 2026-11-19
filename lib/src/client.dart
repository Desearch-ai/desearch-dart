import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'operations.g.dart';

/// A safe error containing no response body, URL, credential, or transport error.
class DesearchException implements Exception {
  /// Constructs an error using a fixed SDK message and optional HTTP status.
  const DesearchException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      'DesearchException: $message'
      '${statusCode == null ? '' : ' (HTTP $statusCode)'}';
}

/// An API response. [data] is decoded JSON, plain text, or null for no content.
class DesearchResponse {
  const DesearchResponse({
    required this.data,
    required this.statusCode,
    this.costUsd,
    this.nextCursor,
  });

  final Object? data;
  final int statusCode;

  /// Optional X-Desearch-Cost-Usd response header; invalid values become null.
  final double? costUsd;

  /// Optional X-Desearch-Next-Cursor response header.
  final String? nextCursor;
}

/// One reusable HTTP transport. API field names and response shapes are preserved.
///
/// There are no retries, polling, automatic pagination, or streaming helpers.
class Desearch {
  /// Uses the public API by default. Supply the dev URL for dev-only credentials.
  ///
  /// An injected [httpClient] remains owned by its caller. The default client is
  /// owned by this instance and closed by [close]. The timeout covers send + body.
  factory Desearch({
    required String apiKey,
    Uri? baseUrl,
    Duration timeout = const Duration(seconds: 60),
    http.Client? httpClient,
  }) {
    if (apiKey.isEmpty ||
        RegExp(r'\s').hasMatch(apiKey) ||
        apiKey.codeUnits.any((c) => c < 33 || c > 126)) {
      throw const DesearchException(
        'API key must be nonempty printable text without whitespace.',
      );
    }
    final base = baseUrl ?? Uri.parse('https://api.desearch.ai');
    if (base.scheme != 'https' ||
        base.host.isEmpty ||
        base.userInfo.isNotEmpty ||
        base.hasQuery ||
        base.hasFragment ||
        (base.path != '' && base.path != '/')) {
      throw const DesearchException('Base URL must be an HTTPS origin.');
    }
    if (timeout <= Duration.zero) {
      throw const DesearchException('Timeout must be positive.');
    }
    return Desearch._(
      apiKey,
      base,
      timeout,
      httpClient ?? http.Client(),
      httpClient == null,
    );
  }

  Desearch._(
    this._apiKey,
    this._baseUrl,
    this.timeout,
    this._httpClient,
    this._ownsClient,
  );

  final String _apiKey;
  final Uri _baseUrl;
  final http.Client _httpClient;
  final bool _ownsClient;
  bool _closed = false;
  final Duration timeout;

  /// Calls a generated operation. Bodies use the API's original snake_case keys.
  /// Path arguments are encoded as single segments, and arrays in queries repeat.
  Future<DesearchResponse> request(
    DesearchOperation operation, {
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) async {
    if (_closed) throw const DesearchException('Client is closed.');
    if (pathParameters.length != operation.pathParameters.length ||
        operation.pathParameters.any(
          (p) => (pathParameters[p] ?? '').isEmpty,
        )) {
      throw const DesearchException('Missing or unexpected path parameters.');
    }
    if (operation.requiredQuery.any((p) => query[p] == null)) {
      throw const DesearchException('Missing required query parameters.');
    }
    if (operation.bodyRequired && body == null) {
      throw const DesearchException('A JSON request body is required.');
    }
    if (body != null && !operation.acceptsBody) {
      throw const DesearchException(
        'This operation does not accept a JSON body.',
      );
    }
    try {
      // Construct by segment so a substituted slash can never change the route.
      final segments = operation.path.substring(1).split('/').map((segment) {
        if (segment.startsWith('{') && segment.endsWith('}')) {
          return pathParameters[segment.substring(1, segment.length - 1)]!;
        }
        return segment;
      }).toList();
      final params = <String, dynamic>{};
      for (final entry in query.entries) {
        final value = entry.value;
        if (value == null) continue;
        if (value is Iterable) {
          final values = value.map(_queryValue).toList();
          params[entry.key] = operation.commaSeparated.contains(entry.key)
              ? values.join(',')
              : values;
        } else {
          params[entry.key] = _queryValue(value);
        }
      }
      final uri = _baseUrl.replace(
        pathSegments: segments,
        queryParameters: params.isEmpty ? null : params,
      );
      final request = http.Request(operation.method, uri)
        ..followRedirects = false
        ..headers['Accept'] = operation.textResponse
            ? 'text/plain'
            : 'application/json';
      if (operation.authenticated) request.headers['Authorization'] = _apiKey;
      if (body != null) {
        request.headers['Content-Type'] = 'application/json';
        request.body = jsonEncode(body);
      }
      final response = await (() async {
        final streamed = await _httpClient.send(request);
        return http.Response.fromStream(streamed);
      })().timeout(timeout);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw DesearchException(
          'API request failed.',
          statusCode: response.statusCode,
        );
      }
      final Object? data;
      if (response.statusCode == 204 || response.bodyBytes.isEmpty) {
        data = null;
      } else if (operation.textResponse ||
          (response.headers['content-type'] ?? '').startsWith('text/') ||
          (response.headers['content-type'] ?? '').startsWith(
            'application/x-ndjson',
          )) {
        data = utf8.decode(response.bodyBytes);
      } else {
        data = jsonDecode(utf8.decode(response.bodyBytes));
      }
      final cost = double.tryParse(
        response.headers['x-desearch-cost-usd'] ?? '',
      );
      return DesearchResponse(
        data: data,
        statusCode: response.statusCode,
        costUsd: cost != null && cost.isFinite ? cost : null,
        nextCursor: response.headers['x-desearch-next-cursor'],
      );
    } on DesearchException {
      rethrow;
    } on TimeoutException {
      throw const DesearchException('Request timed out.');
    } on FormatException {
      throw const DesearchException('Invalid API response encoding.');
    } catch (_) {
      // Third-party exception messages can contain request URLs and credentials.
      throw const DesearchException('Request could not be completed.');
    }
  }

  static String _queryValue(Object? value) {
    if (value is String || value is num || value is bool) return '$value';
    throw const DesearchException(
      'Query values must be scalar or scalar lists.',
    );
  }

  /// Stops new calls. Closing does not cancel a call already in progress.
  void close() {
    if (_closed) return;
    _closed = true;
    if (_ownsClient) _httpClient.close();
  }
}
