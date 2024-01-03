import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transliteration/controllers/history_controller.dart';
import 'package:transliteration/controllers/history_detail_controller.dart';
import 'package:transliteration/controllers/home_controller.dart';
import 'package:transliteration/controllers/main_menu_controller.dart';
import 'package:transliteration/controllers/transliteration_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  HistoryController historyController = Get.find();
  HistoryDetailController historyDetailController = Get.put(HistoryDetailController());
  HomeController homeController = Get.find();
  MainMenuController mainMenuController = Get.find();
  TransliterationController transliterationController = Get.put(TransliterationController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          body: CustomScrollView(slivers: [
        SliverAppBar.medium(
          title: Text(controller.title,
              style: theme.textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w500))),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Wrap(
              runSpacing: 16,
              children: [
                TextField(
                  controller: transliterationController.input,
                  decoration: InputDecoration(
                      hintText: 'Silakan ketik teks yang ingin anda transliterasi di sini',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                  maxLines: 4,
                  maxLength: 50000,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ValueListenableBuilder(
                        valueListenable: transliterationController.input,
                        builder: (_, value, child) {
                          return FilledButton.icon(
                              icon: const Icon(FluentIcons.send_20_regular),
                              label: const Text('Proses'),
                              style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                              onPressed: value.text.isNotEmpty
                                  ? () {
                                      Get.bottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: theme.colorScheme.background,
                                          Padding(
                                            padding: const EdgeInsets.all(32),
                                            child: Wrap(
                                              runSpacing: 16,
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: TextField(
                                                    controller: transliterationController.fileName,
                                                    decoration: InputDecoration(
                                                        labelText: 'Nama Dokumen',
                                                        hintText: 'Beri nama untuk hasil transliterasi',
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(16))),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: double.infinity,
                                                    child: ValueListenableBuilder(
                                                        valueListenable: transliterationController.fileName,
                                                        builder: (_, value, child) {
                                                          return FilledButton(
                                                            onPressed: transliterationController
                                                                    .fileName.text.isNotEmpty
                                                                ? () async {
                                                                    await controller.getConnectivity();
                                                                    if (controller.connection.isFalse) {
                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                      Get.back();
                                                                      Get.snackbar('Gagal',
                                                                          'Tidak dapat terkoneksi dengan sistem transliterasi',
                                                                          backgroundColor:
                                                                              theme.colorScheme.errorContainer,
                                                                          snackStyle: SnackStyle.FLOATING,
                                                                          snackPosition: SnackPosition.TOP,
                                                                          margin: const EdgeInsets.all(16),
                                                                          duration: const Duration(milliseconds: 1750),
                                                                          animationDuration:
                                                                              const Duration(milliseconds: 750));
                                                                    } else {
                                                                      await transliterationController
                                                                          .getNameAvailability(
                                                                              transliterationController.fileName.text);
                                                                      if (transliterationController
                                                                          .isAvailable.isTrue) {
                                                                        await transliterationController.storeStorage();
                                                                        mainMenuController.changePageIndex(1);
                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                        Get.back();
                                                                        Get.snackbar('Berhasil',
                                                                            '${transliterationController.fileName.text}.pdf ditambahkan',
                                                                            backgroundColor:
                                                                                theme.colorScheme.surfaceVariant,
                                                                            snackStyle: SnackStyle.FLOATING,
                                                                            snackPosition: SnackPosition.TOP,
                                                                            margin: const EdgeInsets.all(16),
                                                                            duration:
                                                                                const Duration(milliseconds: 1500),
                                                                            animationDuration:
                                                                                const Duration(milliseconds: 500));
                                                                      } else {
                                                                        Get.snackbar('Error',
                                                                            '${transliterationController.fileName.text}.pdf sudah ada',
                                                                            backgroundColor:
                                                                                theme.colorScheme.errorContainer,
                                                                            snackStyle: SnackStyle.FLOATING,
                                                                            snackPosition: SnackPosition.TOP,
                                                                            margin: const EdgeInsets.all(16),
                                                                            duration:
                                                                                const Duration(milliseconds: 1500),
                                                                            animationDuration:
                                                                                const Duration(milliseconds: 500));
                                                                      }
                                                                    }
                                                                  }
                                                                : null,
                                                            child: const Text('Simpan'),
                                                          );
                                                        }))
                                              ],
                                            ),
                                          ));
                                    }
                                  : null);
                        }))
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 6),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                  onPressed: () async {
                    await mainMenuController.changePageIndex(1);
                    historyController.getAllData();
                  },
                  icon: const Icon(FluentIcons.arrow_right_16_filled),
                  label: const Text('Lihat semua riwayat sebelumnya'),
                  style: TextButton.styleFrom(
                      textStyle: theme.textTheme.bodyLarge?.merge(const TextStyle(fontWeight: FontWeight.w500)))),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          sliver: SliverList.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (_, int index) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    leading: const Icon(FluentIcons.document_pdf_16_regular),
                    title: Text(
                      '${controller.dataList[index].outputName}.pdf',
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                    onTap: () async {
                      await historyDetailController.getData(historyController.dataList[index].transliterationID);
                      await Get.toNamed("/HistoryDetail");
                    },
                  ),
                );
              }),
        )
      ]));
    });
  }
}
