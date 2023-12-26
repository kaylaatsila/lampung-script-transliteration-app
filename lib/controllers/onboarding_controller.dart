import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final String title = 'Selamat Datang';
  final String subtitle = 'di Aplikasi Transliterasi Bahasa Indonesia ke Aksara Lampung';
  final String body = 'Ubah teks dari bahasa Indonesia ke aksara Lampung dengan mudah. Coba fiturnya sekarang!';

  late TextEditingController selectedOccupation;
  late TextEditingController selectedDomicile;
  late TextEditingController filledReason;

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

  @override
  void onInit() {
    super.onInit();

    selectedOccupation = TextEditingController();
    selectedDomicile = TextEditingController();
    filledReason = TextEditingController();
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
