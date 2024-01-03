import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:transliteration/models/file_storage.dart';

const url = 'http://10.0.2.2:8000/api/transliterasi/';

class TransliterationProvider {
  Future<bool> checkUrl() async {
    try {
      http.Response response = await http.get(Uri.parse(url)).timeout(const Duration(milliseconds: 500));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (e) {
      log('Timeout occurred while checking API: $e');
      return false;
    } catch (e) {
      log('Error occurred while checking API: $e');
      return false;
    }
  }

  Future<Map<String, String>> postFile(String text, String name) async {
    FileStorage storage = FileStorage();

    final dir = await getExternalStorageDirectory();
    final outputDirectory = Directory('${dir?.path}/results');

    final box = GetStorage();
    Map<String, dynamic> data = box.read('userData');

    try {
      var txt = await storage.writeTXT(text);

      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri)
        ..fields['user_adress'] = data['domicile']
        ..fields['user_occupation'] = data['occupation']
        ..fields['user_reason'] = data['reason']
        ..files.add(await http.MultipartFile.fromPath('file_input', txt.path, contentType: MediaType('text', 'plain')));

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBytes = await response.stream.toBytes();

        if (await outputDirectory.exists() == false) {
          outputDirectory.create();
        }

        var pdf = await storage.writePDF(responseBytes, name);

        String inputPath = txt.path;
        String outputPath = pdf.path;

        log('$inputPath\n$outputPath\n$name.pdf');

        return {'inputPath': inputPath, 'outputPath': outputPath, 'outputName': name};
      } else {
        throw Exception('Tidak dapat terhubung dengan API');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
