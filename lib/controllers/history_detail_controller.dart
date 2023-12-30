import 'package:get/get.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/utils/db.dart';

class HistoryDetailController extends GetxController {
  final String title = 'Detail';

  List dataList = <Transliteration>[].obs;

  getData(int id) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    List<Map<String, dynamic>> transliterations = await dbHelper.readTransliteration(id);
    dataList.assignAll(transliterations.map((e) => Transliteration.fromMap(e)).toList());

    update();
  }
}
