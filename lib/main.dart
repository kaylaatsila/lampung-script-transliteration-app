import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transliteration/bindings/history_binding.dart';
import 'package:transliteration/bindings/main_menu_binding.dart';
import 'package:transliteration/bindings/onboarding_binding.dart';
import 'package:transliteration/screens/history_detail.dart';
import 'package:transliteration/screens/history_menu.dart';
import 'package:transliteration/screens/main_menu.dart';
import 'package:transliteration/screens/onboarding.dart';
import 'package:transliteration/utils/db.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  
  await DatabaseHelper().initDB();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Transliteration',
      theme: ThemeData(
        fontFamily: 'Google Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Google Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey, brightness: Brightness.dark),
      ),
      getPages: [
        GetPage(
          name: "/", 
          page: ()=> Onboarding(),
          binding: OnboardingBinding(),
        ),
        GetPage(
          name: "/MainMenu", 
          page: ()=> MainMenu(),
          binding: MainMenuBinding(),
        ),
        GetPage(
          name: "/HistoryMenu",
          page: ()=> HistoryMenu(),
          binding: HistoryBinding(),
          transition: Transition.cupertino
        ),
        GetPage(
          name: "/HistoryDetail",
          page: ()=> HistoryDetail(),
          binding: HistoryBinding(),
          transition: Transition.cupertino
        )
      ]
    );
  }
}