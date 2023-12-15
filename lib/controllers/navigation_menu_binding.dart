import 'package:get/get.dart';
import 'navigation_menu_controller.dart';
import 'home_controller.dart';
import 'history_controller.dart';

class NavigationMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationMenuController>(()=>NavigationMenuController());
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<HistoryController>(()=>HistoryController());
  }
}
