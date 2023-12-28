import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  Future<String?> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory?.path;
  }

  Future<File> writeFile(String text) async {
    final path = await _localPath;
    final file = File('$path/text.txt');

    return file.writeAsString(text);
  }
}