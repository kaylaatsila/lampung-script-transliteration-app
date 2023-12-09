import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:get/get.dart';
import 'package:transliteration/navigation_menu_controller.dart';
import 'screens/home.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationMenuController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.currentPageIndex,
              children: [
                Home(),
                Container(),
                Container(),
              ],
            )),

          bottomNavigationBar: NavigationBar(
            onDestinationSelected: controller.changePageIndex,
            selectedIndex: controller.currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(FluentIcons.home_16_regular),
                selectedIcon: Icon(FluentIcons.home_16_filled),
                label: 'Home',
                ),

              NavigationDestination(
                icon: Icon(FluentIcons.history_16_regular),
                selectedIcon: Icon(FluentIcons.history_16_filled),
                label: 'History',
                ),

              NavigationDestination(
                icon: Icon(FluentIcons.person_16_regular),
                selectedIcon: Icon(FluentIcons.person_16_filled),
                label: 'User',
                ),
            ],
          ),
        );
      }
    );
  }
}
