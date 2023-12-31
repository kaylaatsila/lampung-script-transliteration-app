import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final String title = 'Profil Pengguna';

  TextEditingController selectedOccupation = TextEditingController();
  TextEditingController selectedDomicile = TextEditingController();

  List<String> occupationList = ['Pelajar', 'Mahasiswa', 'Guru', 'Praktisi'];
  List<String> domicileList = ['Lampung', 'Sumatera Selatan'];

  final box = GetStorage();

  updateUserData(String occupation, String domicile) {
    Map<String, dynamic> data = box.read('userData');
    
    box.listenKey('userData', (value) {
      print('Data Updated!');
      print('Occupation: ${value['occupation']}');
      print('Occupation: ${value['domicile']}');
    });

    box.write('userData', {'occupation': occupation, 'domicile': domicile, 'reason': data['reason']});
  }
}
