# Desearch for Dart

A thin HTTP SDK for the [Desearch API](https://api.desearch.ai/docs). It preserves API field names and JSON response shapes and provides generated methods over one reusable HTTP client.

Version 0.1.0 is a publication candidate. It has not been published to pub.dev. This source requires **Dart 3.14.1**, pinned exactly for reproducible generation and verification. Flutter and browser runtimes have not been verified.

## Local installation

In a Dart application next to this checkout, use a path dependency:

```yaml
dependencies:
  desearch:
    path: ../desearch-dart
```

Run `dart pub get` in the application. Registry installation instructions will be added after publication.

## Search

```dart
import 'package:desearch/desearch.dart';

Future<void> search(String apiKey) async {
  final client = Desearch(apiKey: apiKey);
  try {
    final response = await client.search(body: {
      'query': 'Dart programming language SDK',
      'mode': 'fast',
      'count': 10,
    });
    final data = response.data as Map<String, dynamic>;
    print(data['results']);
  } finally {
    client.close();
  }
}
```

Credentials are supplied by the caller; the SDK has no credential store. Authentication sends the API key directly in `Authorization`, matching the API contract. Keep keys out of source, URLs and application logs. The default origin is `https://api.desearch.ai`. An explicit HTTPS origin can be supplied with `baseUrl`; use `https://api-dev.desearch.ai` with dev credentials.

To run the included example, supply `DESEARCH_API_KEY` in the process environment. Set `DESEARCH_BASE_URL` to the dev origin when using a dev key. The example performs one billable search and prints its result; the example redacts the exact supplied key from output.

```sh
dart run example/desearch_example.dart
```

## Endpoints and responses

The pinned schema generates 91 operations. See [the method list](tool/OPERATIONS.md) and [OpenAPI snapshot](tool/openapi.json) for their exact fields. The network SSE stream is excluded. Wrapper methods accept `body`, `query` and `pathParameters` maps as appropriate:

```dart
final response = await client.webSearch(query: {'query': 'Dart SDK', 'num': 10});
```

JSON body fields retain the API's snake_case spelling. Required body, query and path presence is checked locally; field types, enums and body field validation remain the API's responsibility. Path values are encoded as single segments. Query nulls are omitted, arrays use repeated parameters unless the schema specifies comma separation, and scalars accept strings, numbers and booleans.

`DesearchResponse.data` contains decoded JSON, UTF-8 text for extraction and text/NDJSON responses, or null for an empty body. It also exposes `statusCode`, optional `costUsd` and `nextCursor` headers. Billing fields in JSON remain in `data`. Responses are buffered in memory. Use the underlying API directly for streaming or very large exports.

Calls to write endpoints perform their documented actions; nothing polls, paginates, retries or creates resources automatically. Only search has been verified against a live dev API; the generated operations have mock transport coverage.

## Errors and lifecycle

`DesearchException` exposes a fixed safe `message` and optional HTTP `statusCode`. HTTP failures, redirects, malformed JSON/UTF-8, transport errors and timeouts produce these errors. Response bodies, request URLs, credentials and transport exception text are excluded from SDK errors. Successful API payloads and cursor headers remain caller data and may be sensitive.

Redirects are rejected. The default timeout is 60 seconds and covers sending and receiving the complete body. A timeout does not cancel the underlying HTTP operation. There are no retries. `close()` stops new calls and closes an SDK-owned client; it does not cancel an in-flight call. An injected `package:http` client remains caller-owned.

## Reproducible development

Use Dart 3.14.1. The HTTP dependency allows compatible 1.x releases; `tool/pubspec.lock` pins the exact verified development dependency graph. From the repository root:

```sh
cp tool/pubspec.lock pubspec.lock
dart pub get
dart pub get --enforce-lockfile
dart run tool/generate.dart --check
dart format --output=none --set-exit-if-changed .
dart analyze --fatal-infos
dart test
mkdir -p build
dart compile exe example/desearch_example.dart -o build/desearch-example
dart pub publish --dry-run
```

The final command only validates the package; it does not publish. These commands can be used in CI. No publishing automation is included.

Generation reads only the committed snapshot and verifies its SHA-256 against `tool/openapi_source.json`. To reproduce the generated file:

```sh
dart run tool/generate.dart
dart run tool/generate.dart --check
```

For an explicit negative live check, supply the same environment variables used for the example:

```sh
dart run tool/verify_live.dart
```

This sends an empty query with a valid key (expected HTTP 422) and one request with an in-memory random invalid key (expected HTTP 401 or 403). It prints only statuses and boolean checks. Unit tests also cover malformed credentials, poisoned HTTP and transport failures, invalid encoding, redirects and timeouts using runtime-generated canaries.

When updating the schema, fetch the public OpenAPI into `tool/openapi.json`, record its actual UTC fetch time and SHA-256 in `tool/openapi_source.json`, review name mappings, regenerate, and run all checks. Schema refreshes and publication are separate reviewed actions. The Desearch Integrations team maintains this package.

## Sources and license

MIT; see [LICENSE](LICENSE). Layout and method naming draw from [desearch.py at f03402db](https://github.com/Desearch-ai/desearch.py/tree/f03402dbf56cdca1cc2aa7f9939478d107cfe884) and [desearch.js at 43b4b745](https://github.com/Desearch-ai/desearch.js/tree/43b4b745fbb7eae8144135d9d718f15336321bf7). Their MIT attribution is retained. Existing endpoint aliases were taken from [sdk-generator configuration at d1fbaa2a](https://github.com/Desearch-ai/sdk-generator/blob/d1fbaa2ad9d28d68ceaf37abc65a53f41776c4c9/config_endpoints.yml); other names derive deterministically from OpenAPI operation IDs. This package uses its own deterministic generator, without an LLM generation dependency.
