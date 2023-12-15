import 'package:get/get.dart';

class NavigationMenuController extends GetxController {
  int currentPageIndex = 0;

  void changePageIndex(int index) {
    currentPageIndex = index;
    update();
  }
}
