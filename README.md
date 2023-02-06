A repro for https://github.com/Dart-Code/Dart-Code/issues/4364.

- Run `tool/create_many_parts.dart`
- Open `lib/foo.dart`
- Invoke code completion at the end of the file
- Run the **Dart: Open Analyzer Diagnostics**
- Click **Completion** on the left
- Click on the slow completion request
- Observe very slow `getSnippets` (8s on my machine)
