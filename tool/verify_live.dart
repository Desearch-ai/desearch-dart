// Runs only negative search requests. Never prints request or response content.
import 'dart:io';
import 'dart:math';

import 'package:desearch/desearch.dart';

Future<void> main() async {
  final key = Platform.environment['DESEARCH_API_KEY'];
  if (key == null || key.isEmpty) {
    stderr.writeln('Set DESEARCH_API_KEY in the environment.');
    exitCode = 64;
    return;
  }
  final canary = List.generate(
    48,
    (_) => String.fromCharCode(65 + Random.secure().nextInt(26)),
  ).join();
  final base = Uri.parse(
    Platform.environment['DESEARCH_BASE_URL'] ?? 'https://api.desearch.ai',
  );
  for (final invalidKey in [false, true]) {
    final client = Desearch(apiKey: invalidKey ? canary : key, baseUrl: base);
    try {
      await client.search(
        body: invalidKey ? {'query': 'Dart', 'count': 10} : {'query': ''},
      );
      stdout.writeln('Negative request unexpectedly succeeded.');
      exitCode = 1;
    } on DesearchException catch (e) {
      final safe =
          !e.toString().contains(key) && !e.toString().contains(canary);
      final expected = invalidKey
          ? [401, 403].contains(e.statusCode)
          : e.statusCode == 422;
      stdout.writeln(
        '${invalidKey ? 'canary' : 'malformed'}: status=${e.statusCode}, safe=$safe, expected=$expected',
      );
      if (!safe || !expected) exitCode = 1;
    } finally {
      client.close();
    }
  }
}
