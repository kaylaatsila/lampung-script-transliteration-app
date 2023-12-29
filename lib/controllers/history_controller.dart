import 'package:get/get.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/utils/db.dart';

class HistoryController extends GetxController {
  final String title = 'Riwayat';

  List dataList = <Transliteration>[].obs;

  @override
  onInit() {
    super.onInit();
    getAllData();
  }

  getAllData() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    
    List<Map<String, dynamic>> transliterations = await dbHelper.fetchAllTransliteration();
    dataList.assignAll(transliterations.map((e) => Transliteration.fromMap(e)).toList());

    print(dataList.length);
  }
}
