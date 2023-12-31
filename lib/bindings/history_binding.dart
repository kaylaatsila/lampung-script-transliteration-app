import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/history_detail_controller.dart';
import 'package:transliteration/controllers/history_menu_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(()=>HistoryController());
    Get.lazyPut<HistoryMenuController>(()=>HistoryMenuController());
    Get.lazyPut<HistoryDetailController>(()=>HistoryDetailController());
  }
}