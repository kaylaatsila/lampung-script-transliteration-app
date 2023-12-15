import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';

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
                onPressed: () {
                  Get.toNamed("/HistoryMenu");
                },
                icon: const Icon(FluentIcons.more_vertical_24_regular),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            sliver: SliverList.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      leading: const Icon(FluentIcons.document_pdf_16_regular),
                      title: Text(
                        'document_${index + 1}.pdf',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
