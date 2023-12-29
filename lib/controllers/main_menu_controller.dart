import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';

class MainMenuController extends GetxController {
  int currentPageIndex = 0;
  List<String> currentPageLabel = ['Beranda', 'Riwayat', 'Pengguna'];

  changePageIndex(int index) {
    currentPageIndex = index;
    update();
  }
}
