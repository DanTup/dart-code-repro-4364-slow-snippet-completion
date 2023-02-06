import 'dart:io';
import 'package:path/path.dart' as path;

void main() {
  final packageRoot = path.dirname(path.dirname(Platform.script.toFilePath()));
  final libraryFile = File(path.join(packageRoot, 'lib', 'many_parts.dart'));
  final partsFolder = Directory(path.join(packageRoot, 'lib', 'many_parts'));
  final partTemplateFile =
      File(path.join(packageRoot, 'lib', 'many_parts_template.dart.txt'));
  final partTemplateContent = partTemplateFile.readAsStringSync();

  var libraryFileContent = '''
library many_parts;

import 'dart:collection';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:string_scanner/string_scanner.dart';

part 'foo.dart';

''';
  for (var i = 1; i <= 100; i++) {
    final partFile = File(path.join(partsFolder.path, 'part$i.dart'));
    libraryFileContent += "part 'many_parts/part$i.dart';\n";
    final partContent = partTemplateContent.replaceAll('INDEX', i.toString());
    partFile.writeAsStringSync("part of '../many_parts.dart';\n\n$partContent");
  }
  libraryFile.writeAsStringSync(libraryFileContent);
}
