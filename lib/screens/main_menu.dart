import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:get/get.dart';
import 'package:transliteration/controllers/main_menu_controller.dart';
import 'package:transliteration/screens/history.dart';
import 'package:transliteration/screens/home.dart';
import 'package:transliteration/screens/user.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainMenuController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.currentPageIndex,
          children: [
            const Home(),
            const History(),
            User(),
          ],
        )),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: controller.changePageIndex,
          selectedIndex: controller.currentPageIndex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: <Widget>[
            NavigationDestination(
              icon: const Icon(FluentIcons.home_16_regular),
              selectedIcon: const Icon(FluentIcons.home_16_filled),
              label: controller.currentPageLabel[controller.currentPageIndex],
            ),
            NavigationDestination(
              icon: const Icon(FluentIcons.history_16_regular),
              selectedIcon: const Icon(FluentIcons.history_16_filled),
              label: controller.currentPageLabel[controller.currentPageIndex],
            ),
            NavigationDestination(
              icon: const Icon(FluentIcons.person_16_regular),
              selectedIcon: const Icon(FluentIcons.person_16_filled),
              label: controller.currentPageLabel[controller.currentPageIndex],
            ),
          ],
        ),
      );
    });
  }
}
