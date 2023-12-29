import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';

class History extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(controller.title,
                style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w500))),
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  await Get.toNamed("/HistoryMenu");
                  await controller.getAllData();
                },
                icon: const Icon(FluentIcons.delete_16_filled),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            sliver: SliverList.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    leading: const Icon(FluentIcons.document_pdf_16_regular),
                    title: Text(
                      controller.dataList[index].outputPath,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
