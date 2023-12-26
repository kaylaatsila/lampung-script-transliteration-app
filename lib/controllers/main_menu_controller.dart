import 'package:get/get.dart';

class MainMenuController extends GetxController {
  int currentPageIndex = 0;
  List<String> currentPageLabel = ['Beranda', 'Riwayat', 'Pengguna'];

  void changePageIndex(int index) {
    currentPageIndex = index;
    update();
  }
}
