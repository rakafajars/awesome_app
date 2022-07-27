import 'dart:io';

import 'package:open_file/open_file.dart';

Future openFile(File file) async {
  final url = file.path;

  await OpenFile.open(url);
}
