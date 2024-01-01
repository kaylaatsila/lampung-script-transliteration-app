import 'package:get/get.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/utils/db.dart';

class HistoryDetailController extends GetxController {
  List dataList = <Transliteration>[].obs;
  final String title = 'Detail';

  getData(int id) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    List<Map<String, dynamic>> transliterations = await dbHelper.readTransliteration(id);
    dataList.assignAll(transliterations.map((e) => Transliteration.fromMap(e)).toList());

    update();
  }
}
