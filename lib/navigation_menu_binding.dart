import 'package:get/get.dart';
import 'package:transliteration/navigation_menu_controller.dart';
import 'screens/home_controller.dart';

class NavigationMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationMenuController>(()=>NavigationMenuController());
    Get.lazyPut<HomeController>(()=>HomeController());
  }
}
