import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/home_controller.dart';
import 'package:transliteration/utils/db.dart';
import 'package:transliteration/services/transliteration_provider.dart';
import 'package:transliteration/models/transliteration.dart';

class TransliterationController extends GetxController {
  TextEditingController fileName = TextEditingController();
  TextEditingController input = TextEditingController();
  var isAvailable = true.obs;

  getNameAvailability(String fileName) async {
    try {
      bool isNameAvailable = await DatabaseHelper().getTansliterationNameAvailability(fileName);
      if (isNameAvailable) {
        isAvailable.value = true;
      } else {
        isAvailable.value = false;
      }
    } catch (e) {
      log(e.toString());
      isAvailable.value = false;
    }
  }

  storeStorage() async {
    try {
      Map<String, String> paths = await TransliterationProvider().postFile(input.text, fileName.text);
      storeDB(paths);
    } catch (e) {
      log(e.toString());
    }
  }

  storeDB(Map<String, String> paths) async {
    try {
      String inputPath = paths['inputPath'] ?? '';
      String outputPath = paths['outputPath'] ?? '';
      String outputName = paths['outputName'] ?? '';

      Transliteration transliteration = Transliteration(
        inputPath: inputPath,
        outputPath: outputPath,
        outputName: outputName,
        timestamp: DateTime.now().toString(),
      );

      await DatabaseHelper().insertTransliteration(transliteration);

      HistoryController historyController = Get.find();
      HomeController homeController = Get.find();
      await historyController.getAllData();
      await homeController.getNewestData();

      update();
    } catch (e) {
      log(e.toString());
    }
  }
}
