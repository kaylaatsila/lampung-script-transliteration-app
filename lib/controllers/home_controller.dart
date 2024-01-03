import 'dart:developer';
import 'package:get/get.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/services/transliteration_provider.dart';
import 'package:transliteration/utils/db.dart';

class HomeController extends GetxController {
  List dataList = <Transliteration>[].obs;
  var connection = true.obs;
  final String title = 'Beranda';

  @override
  onInit() {
    super.onInit();
    getNewestData();
    getConnectivity();
  }

  getConnectivity() async {
    bool isApiWorking = await TransliterationProvider().checkUrl();

    if (isApiWorking) {
      log('API is working!');
      connection.value = true;
    } else {
      log('API is not reachable or not working.');
      connection.value = false;
    }
  }

  getNewestData() async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      List<Map<String, dynamic>> newestRecords = await dbHelper.fetchNewestTransliterations(3);
      dataList.assignAll(newestRecords.map((e) => Transliteration.fromMap(e)).toList());

      update(); // Trigger UI update
    } catch (e) {
      log(e.toString());
    }
  }
}
