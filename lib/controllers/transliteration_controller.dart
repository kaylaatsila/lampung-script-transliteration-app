import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/utils/db.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:transliteration/services/transliteration_provider.dart';
import 'package:transliteration/models/transliteration.dart';

class TransliterationController extends GetxController {
  TextEditingController text = TextEditingController();
  TextEditingController fileName = TextEditingController();

  getPermission() async {
    PermissionStatus permissionStatus = await Permission.storage.status;

    if (permissionStatus.isDenied) {
      Permission.storage.request();
    }

    if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  storeStorage() async {
    getPermission();
    Map<String, String> paths = await TransliterationProvider().postFile(text.text, fileName.text);
    storeDB(paths);
  }

  storeDB(Map<String, String> paths) async {
    getPermission();

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

      DatabaseHelper dbHelper = DatabaseHelper();
      HistoryController historyController = HistoryController();

      await dbHelper.insertTransliteration(transliteration);
      historyController.getAllData();
      
    } catch (e) {
      print(e.toString());
    }
  }
}
