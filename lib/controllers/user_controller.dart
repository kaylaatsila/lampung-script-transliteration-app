import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final String title = 'Profil Pengguna';
  List<String> domicileList = ['Lampung', 'Sumatera Selatan'];
  List<String> occupationList = ['Pelajar', 'Mahasiswa', 'Guru', 'Praktisi'];
  TextEditingController selectedDomicile = TextEditingController();
  TextEditingController selectedOccupation = TextEditingController();
  var storedOccupation = ''.obs;
  var storedDomicile = ''.obs;
  final box = GetStorage();

  @override
  onReady() async {
    super.onReady();
    if (box.read('userData') != null) {
      Map<String, dynamic> data = box.read('userData');
      storedOccupation.value = data['occupation'];
      storedDomicile.value = data['domicile'];
    }
  }  

  updateUserData(String occupation, String domicile) {
    Map<String, dynamic> data = box.read('userData');
    
    box.listenKey('userData', (value) {
      log('Data Updated! Occupation: ${value['occupation']} Domicile: ${value['domicile']}');
    });

    box.write('userData', {'occupation': occupation, 'domicile': domicile, 'reason': data['reason']});
  }
}
