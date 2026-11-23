# Dart SDK maintenance

Use Dart 3.14.1 and the dependency lock at tool/pubspec.lock. Generated operations must be reproduced through tool/generate.dart, never edited directly. Record source fetch time and SHA-256 when refreshing the schema. Preserve upstream MIT attribution.

Run every command in the README reproducible development section. Tests must cover credential redaction, malformed responses and transport failures without recording credentials. Real keys belong only in process environments. Never print raw transport errors or failure bodies.

CI must remain verification-only. Publishing, releases and repository visibility require separate authorization. Do not introduce automatic retries, polling or API resource creation.
