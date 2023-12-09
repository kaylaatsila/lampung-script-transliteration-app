import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transliteration/navigation_menu.dart';
import 'package:transliteration/navigation_menu_binding.dart';

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
          page: ()=>const NavigationMenu(),
          binding: NavigationMenuBinding())
      ]
    );
  }
}

