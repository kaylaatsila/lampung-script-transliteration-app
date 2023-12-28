import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

const url = 'http://10.0.2.2:8000/api/transliterasi/';

class TransliterationProvider {
  Future<void> postFile() async {
    final time = DateFormat('yyyyMMddhhmmss').format(DateTime.now());

    final dir = await getExternalStorageDirectory();
    final fileDirectory = Directory('${dir?.path}/results');
    final fileResult = File('${dir?.path}/results/$time.pdf');

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

      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri)
        ..fields['user_adress'] = 'kayla'
        ..fields['user_occupation'] = 'kayla'
        ..fields['user_reason'] = 'kayla'
        ..files.add(await http.MultipartFile.fromPath('file_input', '${dir?.path}/text.txt',
            contentType: MediaType('text', 'plain')));

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseString = await response.stream.toBytes();

        if (await fileDirectory.exists() == false) {
          fileDirectory.create();
        }
        
        fileResult.writeAsBytes(responseString);

      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

// class TransliterationProvider {
//   final dio = d.Dio();
//   Future<void> postFile() async {
//     final dir = await getExternalStorageDirectory();
//     final file = File('${dir?.path}/text.txt');
//     final formData = d.FormData.fromMap({
//       'user_adress': 'kayla',
//       'user_occupation': 'kayla',
//       'user_reason': 'test_mobile',
//       'file_input': d.MultipartFile.fromFile(file.readAsStringSync(), filename: 'text.txt'),
//     });
//     final response = await dio.post(url, data: formData);
//     print(response.data.toString());
//   }
// }
