import 'package:get/get.dart';
import 'history_controller.dart';
import 'history_menu_controller.dart';

class HistoryMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(()=>HistoryController());
    Get.lazyPut<HistoryMenuController>(()=>HistoryMenuController());
  }
}