import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/history_detail_controller.dart';
import 'package:transliteration/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<HistoryController>(()=>HistoryController());
    Get.lazyPut<HistoryDetailController>(()=>HistoryDetailController());
  }
}