import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:transliteration/models/file_storage.dart';
import 'package:transliteration/services/transliteration_provider.dart';

class TransliterationController extends GetxController {
  TextEditingController text = TextEditingController();
  TextEditingController fileName = TextEditingController();
  FileStorage storage = FileStorage();

  void getPermission() async {
    PermissionStatus permissionStatus = await Permission.storage.status;

    if (permissionStatus.isDenied) {
      Permission.storage.request();
    }

    if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  writeText() async {
    getPermission();
    await storage.writeFile(text.text);
    await TransliterationProvider().postFile();
  }
}
