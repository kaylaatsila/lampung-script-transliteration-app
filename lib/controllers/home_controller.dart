import 'package:get/get.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/utils/db.dart';

class HomeController extends GetxController {
  final String title = 'Beranda';

  List dataList = <Transliteration>[].obs;

  @override
  onInit() {
    super.onInit();
    getNewestData();
  }

  getNewestData() async {
    DatabaseHelper dbHelper = DatabaseHelper();

    List<Map<String, dynamic>> newestRecords = await dbHelper.fetchNewestTransliterations(3);
    dataList.assignAll(newestRecords.map((e) => Transliteration.fromMap(e)).toList());

    print(dataList.length);
  }
}