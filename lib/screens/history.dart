import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/history_detail_controller.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  HistoryDetailController historyDetailController = Get.put(HistoryDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text(controller.title,
                  style:
                      Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w500))),
              actions: [
                IconButton(
                  onPressed: () async {
                    await Get.toNamed("/HistoryMenu");
                    controller.getAllData();
                  },
                  icon: const Icon(FluentIcons.delete_32_regular),
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
                        '${controller.dataList[index].outputName}.pdf',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: Text(DateFormat('E, dd MMM yyy HH:mm')
                          .format(DateTime.parse(controller.dataList[index].timestamp).toLocal())
                          .toString()),
                      onTap: () async {
                        await historyDetailController.getData(controller.dataList[index].transliterationID);
                        await Get.toNamed("/HistoryDetail");
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
