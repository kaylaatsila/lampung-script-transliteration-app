import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transliteration/controllers/history_controller.dart';
import '../controllers/history_menu_controller.dart';

class HistoryMenu extends StatefulWidget {
  const HistoryMenu({super.key});

  @override
  State<HistoryMenu> createState() => _HistoryMenu();
}

class _HistoryMenu extends State<HistoryMenu> {
  HistoryController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryMenuController>(builder: (controller) {
      return Scaffold(
          body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(controller.title,
              style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(fontWeight: FontWeight.w500))),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverList.builder(
            itemCount: historyController.dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  leading: const Icon(FluentIcons.document_pdf_16_regular),
                  title: Text(
                    '${historyController.dataList[index].outputName}.pdf',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(DateFormat('E, dd MMM yyy HH:mm')
                      .format(DateTime.parse(historyController.dataList[index].timestamp).toLocal())
                      .toString()),
                  trailing: InkWell(
                      onTap: () async {
                        await controller.deleteData(historyController.dataList[index].transliterationID);
                        Get.snackbar(
                          'Berhasil', 
                          '${historyController.dataList[index].outputName}.pdf terhapus',
                          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                          snackStyle: SnackStyle.FLOATING,
                          snackPosition: SnackPosition.TOP,
                          margin: const EdgeInsets.all(16),
                          duration: const Duration(milliseconds: 1500),
                          animationDuration: const Duration(milliseconds: 500));
                      },
                      child: const Icon(FluentIcons.delete_16_regular)),
                ),
              );
            },
          ),
        )
      ]));
    });
  }
}