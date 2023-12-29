import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:transliteration/models/file_storage.dart';

const url = 'http://10.0.2.2:8000/api/transliterasi/';

class TransliterationProvider {
  Future<Map<String, String>> postFile(String text, String name) async {
    FileStorage storage = FileStorage();
    final dir = await getExternalStorageDirectory();
    final outputDirectory = Directory('${dir?.path}/results');

    try {
      // final form = FormData({
      //   'user_adress': 'kayla',
      //   'user_occupation': 'kayla',
      //   'user_reason': 'test_mobile',
      //   'file_input': MultipartFile(file, filename: 'text.txt', contentType: 'text/plain'),
      // });
      // final response = await post(
      //   url,
      //   form,
      //   contentType: "multipart/form-data",
      // );
      // if (response.status.hasError) {
      //   print('Error uploading file: ${response.statusCode}: ${response.statusText}');
      //   return response;
      // }
      // return response;

      var txt = await storage.writeTXT(text);

      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri)
        ..fields['user_adress'] = 'kayla'
        ..fields['user_occupation'] = 'kayla'
        ..fields['user_reason'] = 'kayla'
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

        print('$inputPath\n$outputPath\n$name.pdf');

        return {'inputPath': inputPath, 'outputPath': outputPath, 'outputName': name};
      }

      return {};
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
