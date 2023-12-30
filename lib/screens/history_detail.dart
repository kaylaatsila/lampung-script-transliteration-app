import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:transliteration/controllers/history_detail_controller.dart';

class HistoryDetail extends GetView<HistoryDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Text(controller.dataList[0].outputName,
            style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w500))),
        pinned: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Share.shareXFiles([XFile(controller.dataList[0].outputPath)]);
            },
            icon: const Icon(FluentIcons.share_android_32_regular),
          )
        ],
      ),
      SliverSafeArea(
          sliver: SliverToBoxAdapter(
              child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SfPdfViewer.file(
          File(controller.dataList[0].outputPath),
          scrollDirection: PdfScrollDirection.horizontal,
          pageSpacing: 1,
        ),
      )))
    ]));
  }
}
