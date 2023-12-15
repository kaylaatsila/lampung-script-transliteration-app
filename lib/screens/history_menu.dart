import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_menu_controller.dart';

class HistoryMenu extends StatefulWidget {
  const HistoryMenu({super.key});

  @override
  State<HistoryMenu> createState() => _HistoryMenuState();
}

class _HistoryMenuState extends State<HistoryMenu> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryMenuController>(
      builder: (controller) {
      return Scaffold(
          body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(controller.title,
              style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(fontWeight: FontWeight.w500))),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(FluentIcons.arrow_left_16_filled)),
        )
      ])        );
      }
    );
  }
}
                // actions: <Widget>[;