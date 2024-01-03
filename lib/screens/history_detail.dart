import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:transliteration/controllers/history_detail_controller.dart';

class HistoryDetail extends GetView<HistoryDetailController> {
  const HistoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Text(controller.dataList[0].outputName,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall?.merge(const TextStyle(fontWeight: FontWeight.w500))),
        pinned: true,
        actions: [
          IconButton(
            onPressed: File(controller.dataList[0].outputPath).existsSync()
                ? () async {
                    await Share.shareXFiles([XFile(controller.dataList[0].outputPath)]);
                  }
                : null,
            icon: const Icon(FluentIcons.share_android_32_regular),
          )
        ],
      ),
      SliverSafeArea(
          sliver: SliverToBoxAdapter(
              child: File(controller.dataList[0].outputPath).existsSync()
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: SfPdfViewer.file(
                        File(controller.dataList[0].outputPath),
                        scrollDirection: PdfScrollDirection.horizontal,
                        pageSpacing: 1,
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Dokumen terhapus dari penyimpanan'),
                    )))
    ]));
  }
}
