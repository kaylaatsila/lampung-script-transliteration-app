import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/navigation_menu.dart';
import 'controllers/navigation_menu_binding.dart';
import 'screens/history_menu.dart';
import 'controllers/history_menu_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          page: ()=> NavigationMenu(),
          binding: NavigationMenuBinding(),
        ),
        GetPage(
          name: "/HistoryMenu",
          page: ()=> HistoryMenu(),
          binding: HistoryMenuBinding(),
          transition: Transition.noTransition
        )
      ]
    );
  }
}

