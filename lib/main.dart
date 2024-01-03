import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transliteration/controllers/onboarding_controller.dart';
import 'package:transliteration/routes/app_pages.dart';
import 'package:transliteration/screens/onboarding.dart';
import 'package:transliteration/utils/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initDB();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final onboardingController = Get.put(OnboardingController());

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
        home: const Onboarding(),
        getPages: AppPages.pages);
  }
}
