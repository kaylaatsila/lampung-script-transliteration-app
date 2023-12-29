import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/home_controller.dart';

class OnboardingController extends GetxController {
  final String title = 'Selamat Datang';
  final String subtitle = 'di Aplikasi Transliterasi Bahasa Indonesia ke Aksara Lampung';
  final String body = 'Ubah teks dari bahasa Indonesia ke aksara Lampung dengan mudah. Coba fiturnya sekarang!';

  TextEditingController selectedOccupation = TextEditingController();
  TextEditingController selectedDomicile = TextEditingController();
  TextEditingController filledReason = TextEditingController();

  List<String> occupationList = ['Pelajar', 'Mahasiswa', 'Guru', 'Praktisi'];
  List<String> domicileList = ['Lampung', 'Sumatera Selatan'];

  var isFirstTime = true.obs;

  void errorMessage(String msg) {
    Get.defaultDialog(
      title: 'Error',
      middleText: msg,
    );
  }

  void proceedOnboarding(String occupation, String domicile, String reason) async {
    if (occupation.isNotEmpty && domicile.isNotEmpty && reason.isNotEmpty) {
      isFirstTime.value = false;

      await GetStorage.init();
      final box = GetStorage();
      box.write(
        'userData',
        {
          'occupation': occupation,
          'domicile': domicile,
          'reason': reason,
          'isFirstTime': isFirstTime.value,
        },
      );
    } else {
      errorMessage('Semua data harus diisi');
    }
  }

  // Future<void> skipOnboarding() async {
  //   final box = GetStorage();
  //   if (box.read('userData') != null) {
  //     final data = box.read('userData') as Map<String, dynamic>;
  //     if (data['isFirsTime'] == false) {
  //       isFilled.value = true;
  //     }
  //   }
  // }
}
