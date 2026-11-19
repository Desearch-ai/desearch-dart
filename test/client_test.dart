import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:desearch/desearch.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

String canary() => List.generate(
  40,
  (_) => String.fromCharCode(65 + Random.secure().nextInt(26)),
).join();

void main() {
  late String key;
  setUp(() => key = canary());

  test('search preserves raw auth, JSON fields, billing and cursor', () async {
    final client = Desearch(
      apiKey: key,
      httpClient: MockClient((r) async {
        expect(r.method, 'POST');
        expect(r.url.toString(), 'https://api.desearch.ai/search');
        expect(r.headers['Authorization'] == key, isTrue);
        expect(r.followRedirects, isFalse);
        expect(jsonDecode(r.body), {'query': 'Dart SDK', 'count': 10});
        return http.Response(
          '{"results":[{"title":"Dart"}]}',
          200,
          headers: {
            'x-desearch-cost-usd': '0.002',
            'x-desearch-next-cursor': 'next',
          },
        );
      }),
    );
    final response = await client.search(
      body: {'query': 'Dart SDK', 'count': 10},
    );
    expect(response.statusCode, 200);
    expect(response.data, {
      'results': [
        {'title': 'Dart'},
      ],
    });
    expect(response.costUsd, 0.002);
    expect(response.nextCursor, 'next');
    client.close();
  });

  test(
    'path values cannot inject route or query; arrays repeat and null omits',
    () async {
      final operation = DesearchOperation.values.firstWhere(
        (o) => o.pathParameters.isNotEmpty && o.method == 'GET',
      );
      final client = Desearch(
        apiKey: key,
        httpClient: MockClient((r) async {
          expect(r.url.pathSegments.contains('a/b?c#d'), isTrue);
          expect(r.url.queryParametersAll['tags'], ['one', 'two']);
          expect(r.url.queryParameters['flag'], 'true');
          expect(r.url.queryParameters.containsKey('missing'), isFalse);
          return http.Response('[]', 200);
        }),
      );
      await client.request(
        operation,
        pathParameters: {
          for (final p in operation.pathParameters) p: 'a/b?c#d',
        },
        query: {
          'tags': ['one', 'two'],
          'flag': true,
          'missing': null,
        },
      );
      client.close();
    },
  );

  test(
    'public operation omits credential and text responses remain text',
    () async {
      var calls = 0;
      final client = Desearch(
        apiKey: key,
        httpClient: MockClient((r) async {
          calls++;
          if (calls == 1) {
            expect(r.headers.containsKey('Authorization'), isFalse);
            return http.Response(
              '{}',
              200,
              headers: {'x-desearch-cost-usd': 'NaN'},
            );
          }
          return http.Response(
            'hello,world',
            200,
            headers: {'content-type': 'text/csv'},
          );
        }),
      );
      expect((await client.getNetworkStats()).costUsd, isNull);
      expect(
        (await client.search(body: {'query': 'test'})).data,
        'hello,world',
      );
      client.close();
    },
  );

  test('empty successful body maps to null', () async {
    final client = Desearch(
      apiKey: key,
      httpClient: MockClient((_) async => http.Response('', 204)),
    );
    expect((await client.search(body: {'query': 'test'})).data, isNull);
    client.close();
  });

  test(
    'required inputs and invalid query values fail before transport',
    () async {
      var calls = 0;
      final client = Desearch(
        apiKey: key,
        httpClient: MockClient((_) async {
          calls++;
          return http.Response('{}', 200);
        }),
      );
      await expectLater(client.search(), throwsA(isA<DesearchException>()));
      await expectLater(
        client.desearchCrawl(),
        throwsA(isA<DesearchException>()),
      );
      await expectLater(
        client.getNetworkStats(body: {}),
        throwsA(isA<DesearchException>()),
      );
      await expectLater(
        client.search(body: {}, pathParameters: {'extra': 'x'}),
        throwsA(isA<DesearchException>()),
      );
      await expectLater(
        client.search(body: {}, query: {'bad': <String, Object?>{}}),
        throwsA(isA<DesearchException>()),
      );
      expect(calls, 0);
      client.close();
    },
  );

  for (final status in [302, 401, 422, 429, 500]) {
    test('HTTP $status errors redact canary in body and headers', () async {
      var calls = 0;
      final client = Desearch(
        apiKey: key,
        httpClient: MockClient((_) async {
          calls++;
          return http.Response(
            key,
            status,
            headers: {'location': 'https://example.org/$key'},
          );
        }),
      );
      try {
        await client.search(body: {'query': 'test'});
        fail('Expected safe error');
      } on DesearchException catch (e) {
        expect(e.statusCode, status);
        expect(e.toString().contains(key), isFalse);
        expect(e.message, 'API request failed.');
      }
      expect(calls, 1);
      client.close();
    });
  }

  test('transport and malformed JSON errors do not leak canary', () async {
    for (final transportFailure in [true, false]) {
      final client = Desearch(
        apiKey: key,
        httpClient: MockClient((_) async {
          if (transportFailure) {
            throw http.ClientException(
              key,
              Uri.parse('https://example.org/$key'),
            );
          }
          return http.Response(key, 200);
        }),
      );
      try {
        await client.search(body: {'query': 'test'});
        fail('Expected safe error');
      } on DesearchException catch (e) {
        expect(e.toString().contains(key), isFalse);
        expect(e.statusCode, isNull);
      }
      client.close();
    }
  });

  test('malformed UTF8 produces safe encoding error', () async {
    final client = Desearch(
      apiKey: key,
      httpClient: MockClient((_) async => http.Response.bytes([255], 200)),
    );
    await expectLater(
      client.search(body: {}),
      throwsA(
        isA<DesearchException>().having(
          (e) => e.message,
          'message',
          'Invalid API response encoding.',
        ),
      ),
    );
    client.close();
  });

  test('timeout covers sending and streamed body', () async {
    for (final slowBody in [false, true]) {
      final client = Desearch(
        apiKey: key,
        timeout: const Duration(milliseconds: 10),
        httpClient: MockClient.streaming((_, _) async {
          if (!slowBody) {
            await Future<void>.delayed(const Duration(milliseconds: 40));
          }
          return http.StreamedResponse(
            Stream<List<int>>.fromFuture(
              Future.delayed(
                const Duration(milliseconds: 40),
                () => utf8.encode('{}'),
              ),
            ),
            200,
          );
        }),
      );
      await expectLater(
        client.search(body: {}),
        throwsA(
          isA<DesearchException>().having(
            (e) => e.message,
            'message',
            'Request timed out.',
          ),
        ),
      );
      client.close();
    }
  });

  test(
    'invalid credentials/origins/timeouts are safe and close is idempotent',
    () async {
      for (final bad in ['', '$key\n', ' $key', 'é$key']) {
        try {
          Desearch(apiKey: bad);
          fail('Expected rejection');
        } on DesearchException catch (e) {
          expect(e.toString().contains(key), isFalse);
        }
      }
      for (final base in [
        'http://example.org',
        'https://example.org/path',
        'https://user:pass@example.org',
        'https://example.org/?x=1',
      ]) {
        expect(
          () => Desearch(apiKey: key, baseUrl: Uri.parse(base)),
          throwsA(isA<DesearchException>()),
        );
      }
      expect(
        () => Desearch(apiKey: key, timeout: Duration.zero),
        throwsA(isA<DesearchException>()),
      );
      final transport = _TrackingClient();
      final client = Desearch(apiKey: key, httpClient: transport);
      client.close();
      client.close();
      expect(transport.closed, isFalse);
      await expectLater(
        client.search(body: {}),
        throwsA(isA<DesearchException>()),
      );
      transport.close();
    },
  );
}

class _TrackingClient extends http.BaseClient {
  bool closed = false;
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async =>
      http.StreamedResponse(Stream.value(utf8.encode('{}')), 200);
  @override
  void close() => closed = true;
}
