import 'dart:convert';
import 'dart:io';

import 'package:desearch/desearch.dart';

Future<void> main() async {
  final key = Platform.environment['DESEARCH_API_KEY'];
  if (key == null || key.isEmpty) {
    stderr.writeln('Set DESEARCH_API_KEY in the environment.');
    exitCode = 64;
    return;
  }
  Desearch? client;
  try {
    client = Desearch(
      apiKey: key,
      baseUrl: Uri.parse(
        Platform.environment['DESEARCH_BASE_URL'] ?? 'https://api.desearch.ai',
      ),
    );
    final response = await client.search(
      body: {
        'query': 'Dart programming language SDK',
        'mode': 'fast',
        'count': 10,
      },
    );
    final output = jsonEncode({
      'status': response.statusCode,
      'data': response.data,
      'cost_usd': response.costUsd,
    });
    stdout.writeln(output.replaceAll(key, '[REDACTED]'));
  } on DesearchException catch (e) {
    stderr.writeln(e);
    exitCode = 1;
  } catch (_) {
    stderr.writeln('Unable to run the search example.');
    exitCode = 1;
  } finally {
    client?.close();
  }
}
