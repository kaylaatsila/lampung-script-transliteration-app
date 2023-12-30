import 'package:get/get.dart';
import 'package:transliteration/models/transliteration.dart';
import 'package:transliteration/utils/db.dart';

class HistoryController extends GetxController {
  final String title = 'Riwayat';

  List dataList = <Transliteration>[].obs;
  var isLoading = true.obs;

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

      isLoading.value = false; // Assuming data retrieval is complete
      update(); // Trigger UI update
    } catch (e) {
      print(e.toString());
    }
  }
}
