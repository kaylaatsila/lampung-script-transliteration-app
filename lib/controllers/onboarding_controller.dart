import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transliteration/controllers/transliteration_controller.dart';

class OnboardingController extends GetxController {
  final String title = 'Selamat Datang';
  final String subtitle = 'di Aplikasi Transliterasi Bahasa Indonesia ke Aksara Lampung';
  final String body = 'Ubah teks dari bahasa Indonesia ke aksara Lampung dengan mudah. Coba fiturnya sekarang!';

  TextEditingController selectedOccupation = TextEditingController();
  TextEditingController selectedDomicile = TextEditingController();
  TextEditingController filledReason = TextEditingController();

  List<String> occupationList = ['Pelajar', 'Mahasiswa', 'Guru', 'Praktisi'];
  List<String> domicileList = ['Lampung', 'Sumatera Selatan'];

  var storedOccupation = ''.obs;
  var storedDomicile = ''.obs;

  final box = GetStorage();

  TransliterationController transliterationController = Get.put(TransliterationController());

  @override
  onReady() async{
    super.onReady();

    await transliterationController.getPermission();

    if (box.read('userData') != null) {
      Map<String, dynamic> data = box.read('userData');
      storedOccupation.value = data['occupation'];
      storedDomicile.value = data['domicile'];

      Get.offAllNamed('/MainMenu');
    } else {
      Get.toNamed('/Onboarding');
    }
  }

  storeUserData(String occupation, String domicile, String reason) async {
    if (occupation.isNotEmpty && domicile.isNotEmpty && reason.isNotEmpty) {
      box.writeIfNull('userData', {'occupation': occupation, 'domicile': domicile, 'reason': reason});
      log(box.read('userData'));

      Get.offAllNamed('/MainMenu');
    } else {
      errorMessage('Something wrong');
    }
  }

  errorMessage(String msg) {
    Get.defaultDialog(
      title: 'Error',
      middleText: msg,
    );
  }
}
