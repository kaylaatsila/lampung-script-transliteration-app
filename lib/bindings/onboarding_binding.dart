import 'package:get/get.dart';
import 'package:transliteration/controllers/onboarding_controller.dart';
import 'package:transliteration/controllers/user_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(()=>OnboardingController());
    Get.lazyPut<UserController>(()=>UserController());
  }
}
