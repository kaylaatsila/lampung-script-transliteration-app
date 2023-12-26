import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/home_controller.dart';
import 'package:transliteration/controllers/main_menu_controller.dart';
import 'package:transliteration/controllers/user_controller.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainMenuController>(()=>MainMenuController());
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<HistoryController>(()=>HistoryController());
    Get.lazyPut<UserController>(()=>UserController());
  }
}
