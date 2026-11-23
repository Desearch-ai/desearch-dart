// Deterministic generation from the committed OpenAPI snapshot. No network calls.
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';

void main(List<String> args) {
  if (args.any((arg) => arg != '--check')) {
    stderr.writeln('Usage: dart run tool/generate.dart [--check]');
    exitCode = 64;
    return;
  }
  final bytes = File('tool/openapi.json').readAsBytesSync();
  final source = jsonDecode(
    File('tool/openapi_source.json').readAsStringSync(),
  ) as Map<String, dynamic>;
  if (sha256.convert(bytes).toString() != source['sha256']) {
    stderr.writeln(
      'OpenAPI checksum mismatch. Review and update source metadata.',
    );
    exitCode = 1;
    return;
  }
  final spec = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
  final names = jsonDecode(
    File('tool/operation_names.json').readAsStringSync(),
  ) as Map<String, dynamic>;
  final paths = spec['paths'] as Map<String, dynamic>;
  final entries = <String>[];
  final methods = <String>[];
  final rows = <String>[];
  final usedNames = <String>{};
  var count = 0;
  for (final path in paths.keys.toList()..sort()) {
    final item = paths[path] as Map<String, dynamic>;
    for (final verb in item.keys.toList()..sort()) {
      if (!['get', 'post', 'patch', 'put', 'delete'].contains(verb)) continue;
      final op = item[verb] as Map<String, dynamic>;
      if (path == '/network/stats/stream') continue;
      final name =
          names['${verb.toUpperCase()} $path'] as String? ??
          _name(op['operationId'] as String, path, verb);
      if (!RegExp(r'^[a-z][a-zA-Z0-9]*$').hasMatch(name) ||
          !usedNames.add(name)) {
        throw StateError('Duplicate or invalid operation name: $name');
      }
      final params = <Map<String, dynamic>>[
        ...((item['parameters'] ?? <dynamic>[]) as List<dynamic>)
            .cast<Map<String, dynamic>>(),
        ...((op['parameters'] ?? <dynamic>[]) as List<dynamic>)
            .cast<Map<String, dynamic>>(),
      ];
      final pathParams = params
          .where((p) => p['in'] == 'path')
          .map((p) => p['name'] as String)
          .toList();
      final query = params
          .where((p) => p['in'] == 'query' && p['required'] == true)
          .map((p) => p['name'] as String)
          .toList();
      final comma = params
          .where((p) => p['in'] == 'query' && p['explode'] == false)
          .map((p) => p['name'] as String)
          .toList();
      final responses = op['responses'] as Map<String, dynamic>;
      final contentTypes = <String>{};
      for (final r in responses.entries.where((r) => r.key.startsWith('2'))) {
        contentTypes.addAll(
          ((r.value as Map<String, dynamic>)['content']
                      as Map<String, dynamic>? ??
                  {})
              .keys,
        );
      }
      final isText =
          !contentTypes.contains('application/json') &&
          contentTypes.any((c) => c.startsWith('text/'));
      final security = op.containsKey('security')
          ? op['security']
          : spec['security'];
      final auth = security is List && security.isNotEmpty;
      final requestBody = op['requestBody'] as Map<String, dynamic>?;
      entries.add(
        '  $name(${jsonEncode(verb.toUpperCase())}, ${jsonEncode(path)}, '
        'pathParameters: ${jsonEncode(pathParams)}, requiredQuery: ${jsonEncode(query)}, '
        'commaSeparated: ${jsonEncode(comma)}, authenticated: $auth, '
        'acceptsBody: ${requestBody != null}, bodyRequired: ${requestBody?['required'] == true}, textResponse: $isText)',
      );
      methods.add(
        '''  /// ${verb.toUpperCase()} $path. See the pinned OpenAPI for fields and response shape.
  Future<DesearchResponse> $name({
    Map<String, String> pathParameters = const {},
    Map<String, Object?> query = const {},
    Map<String, Object?>? body,
  }) => request(DesearchOperation.$name,
    pathParameters: pathParameters, query: query, body: body);
''',
      );
      count++;
      rows.add('| `$name` | ${verb.toUpperCase()} | `$path` |');
    }
  }
  final output =
      '''// GENERATED CODE. DO NOT EDIT. Run dart run tool/generate.dart.
// Schema provenance: tool/openapi_source.json (SHA-256 verified before generation).
import 'client.dart';

/// HTTP operations from the pinned schema, excluding the SSE stream.
enum DesearchOperation {
${entries.join(',\n')};

  const DesearchOperation(this.method, this.path, {
    required this.pathParameters, required this.requiredQuery,
    required this.commaSeparated, required this.authenticated,
    required this.acceptsBody, required this.bodyRequired, required this.textResponse,
  });
  final String method;
  final String path;
  final List<String> pathParameters;
  final List<String> requiredQuery;
  final List<String> commaSeparated;
  final bool authenticated;
  final bool acceptsBody;
  final bool bodyRequired;
  final bool textResponse;
}

/// Named endpoint wrappers sharing the same transport and error handling.
extension DesearchEndpoints on Desearch {
${methods.join('\n')}
}
''';
  // Format with the same SDK used for generation, to keep --check byte-exact.
  final temp = Directory.systemTemp.createTempSync('desearch-generate-');
  try {
    final formatted = File('${temp.path}/operations.dart')
      ..writeAsStringSync(output);
    final result = Process.runSync(Platform.resolvedExecutable, [
      'format',
      formatted.path,
    ]);
    if (result.exitCode != 0) {
      throw StateError('Formatting generated operations failed.');
    }
    final text = formatted.readAsStringSync();
    final target = File('lib/src/operations.g.dart');
    final index = File('tool/OPERATIONS.md');
    final indexText =
        '# Generated HTTP methods\n\nDerived from the pinned OpenAPI snapshot. All methods use the shared transport.\n\n| Method | HTTP | Path |\n| --- | --- | --- |\n${rows.join('\n')}\n';
    if (args.contains('--check')) {
      if (!target.existsSync() ||
          target.readAsStringSync() != text ||
          !index.existsSync() ||
          index.readAsStringSync() != indexText) {
        stderr.writeln('Generated operations are stale.');
        exitCode = 1;
        return;
      }
    } else {
      target.writeAsStringSync(text);
      index.writeAsStringSync(indexText);
    }
    stdout.writeln('Verified $count operations against the pinned OpenAPI.');
  } finally {
    temp.deleteSync(recursive: true);
  }
}

String _name(String id, String path, String verb) {
  final suffix =
      '_${path.substring(1).replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')}_$verb';
  final prefix = id.endsWith(suffix)
      ? id.substring(0, id.length - suffix.length)
      : id;
  final words = prefix.split('_').where((s) => s.isNotEmpty).toList();
  return words.first +
      words.skip(1).map((w) => w[0].toUpperCase() + w.substring(1)).join();
}
