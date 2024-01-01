import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/history_detail_controller.dart';
import 'package:transliteration/controllers/history_menu_controller.dart';
import 'package:transliteration/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<HistoryController>(()=>HistoryController());
    Get.lazyPut<HistoryMenuController>(()=>HistoryMenuController());
    Get.lazyPut<HistoryDetailController>(()=>HistoryDetailController());
  }
}