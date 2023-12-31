import 'package:get/get.dart';
import 'package:transliteration/bindings/history_binding.dart';
import 'package:transliteration/bindings/main_menu_binding.dart';
import 'package:transliteration/bindings/onboarding_binding.dart';
import 'package:transliteration/screens/history_detail.dart';
import 'package:transliteration/screens/history_menu.dart';
import 'package:transliteration/screens/main_menu.dart';
import 'package:transliteration/screens/onboarding.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: "/",
      page: () => Onboarding(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: "/MainMenu",
      page: () => const MainMenu(),
      binding: MainMenuBinding(),
    ),
    GetPage(
        name: "/HistoryMenu", 
        page: () => HistoryMenu(), 
        binding: HistoryBinding(), 
        transition: Transition.cupertino),
    GetPage(
        name: "/HistoryDetail",
        page: () => HistoryDetail(),
        binding: HistoryBinding(),
        transition: Transition.cupertino)
  ];
}
