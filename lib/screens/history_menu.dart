import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_menu_controller.dart';

class HistoryMenu extends GetView<HistoryMenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Text(controller.title,
            style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(fontWeight: FontWeight.w500))),
      )
    ]));
  }
}
                // actions: <Widget>[;