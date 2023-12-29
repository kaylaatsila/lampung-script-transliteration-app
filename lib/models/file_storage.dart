import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class FileStorage {
  final time = DateFormat('yyyyMMddhhmmss').format(DateTime.now());

  Future<String?> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory?.path;
  }

  Future<File> writeTXT(String text) async {
    final path = await _localPath;
    final file = File('$path/$time.txt');

    return file.writeAsString(text);
  }

  Future<File> writePDF(var byte, String name) async {
    final path = await _localPath;
    final file = File('$path/results/$name.pdf');

    return file.writeAsBytes(byte);
  }
}
