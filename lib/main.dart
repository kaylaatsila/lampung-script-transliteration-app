import 'package:flutter/material.dart';
import 'package:transliteration/navigation_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transliteration',
      theme: ThemeData(
        fontFamily: 'Google Sans',
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),

      home: const NavigationMenu(),
    );
  }
}

