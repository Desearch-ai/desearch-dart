import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:desearch/desearch.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  test('operation coverage and metadata match the pinned source', () async {
    final bytes = File('tool/openapi.json').readAsBytesSync();
    final source = jsonDecode(
      File('tool/openapi_source.json').readAsStringSync(),
    ) as Map<String, dynamic>;
    expect(sha256.convert(bytes).toString(), source['sha256']);
    final schema = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
    final paths = schema['paths'] as Map<String, dynamic>;
    final expected = <String>{};
    for (final path in paths.entries) {
      for (final verb in (path.value as Map<String, dynamic>).keys) {
        if (['get', 'post', 'put', 'patch', 'delete'].contains(verb) &&
            path.key != '/network/stats/stream') {
          expected.add('${verb.toUpperCase()} ${path.key}');
        }
      }
    }
    expect(
      DesearchOperation.values.map((o) => '${o.method} ${o.path}').toSet(),
      expected,
    );
    final key = List.generate(
      40,
      (_) => String.fromCharCode(65 + Random.secure().nextInt(26)),
    ).join();
    for (final operation in DesearchOperation.values) {
      final op =
          (paths[operation.path] as Map<String, dynamic>)[operation.method
                  .toLowerCase()]
              as Map<String, dynamic>;
      final security = op['security'] ?? schema['security'];
      final requiresAuth = (security as List<dynamic>).isNotEmpty;
      var calls = 0;
      final client = Desearch(
        apiKey: key,
        httpClient: MockClient((r) async {
          calls++;
          expect(r.method, operation.method);
          expect(r.headers.containsKey('Authorization'), requiresAuth);
          if (requiresAuth) expect(r.headers['Authorization'] == key, isTrue);
          expect(
            r.url.path,
            operation.path.replaceAll(RegExp(r'\{[^}]+\}'), 'sample'),
          );
          return http.Response(operation.textResponse ? 'text' : '{}', 200);
        }),
      );
      await client.request(
        operation,
        pathParameters: {
          for (final name in operation.pathParameters) name: 'sample',
        },
        query: {for (final name in operation.requiredQuery) name: 'sample'},
        body: operation.acceptsBody ? {} : null,
      );
      expect(calls, 1);
      client.close();
    }
  });
}
