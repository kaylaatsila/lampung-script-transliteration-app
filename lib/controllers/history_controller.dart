import 'dart:developer';

import 'package:get/get.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/utils/db.dart';

class HistoryController extends GetxController {
  List dataList = <Transliteration>[].obs;
  final String title = 'Riwayat';

  @override
  onInit() {
    super.onInit();
    getAllData();
  }

  getAllData() async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      List<Map<String, dynamic>> transliterations = await dbHelper.fetchAllTransliteration();
      dataList.assignAll(transliterations.map((e) => Transliteration.fromMap(e)).toList());

      update();
    } catch (e) {
      log(e.toString());
    }
  }
}
