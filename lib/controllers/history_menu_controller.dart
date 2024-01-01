import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/utils/db.dart';

class HistoryMenuController extends GetxController {
  List dataList = <Transliteration>[].obs;
  HistoryController historyController = Get.find();
  final String title = 'Hapus';

  @override
  onInit() {
    super.onInit();
    historyController.getAllData();
  }

  deleteData(int id) async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      await dbHelper.deleteTransliteration(id);
      await historyController.getAllData();

      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
