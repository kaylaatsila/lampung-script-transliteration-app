import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar.medium(
        title: Text(controller.title,
            style: Theme.of(context).textTheme.headlineMedium?.merge(const TextStyle(fontWeight: FontWeight.w500))),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Wrap(
            runSpacing: 16,
            children: [
              // SegmentedButton(
              //   segments: const [
              //     ButtonSegment(value: 'text', label: Text('Text')),
              //     ButtonSegment(value: 'upload_file', label: Text('Upload File'))
              //   ],
              //   selected: controller.modeSelected,
              //   onSelectionChanged: (selected) {
              //     controller.modeSelected = selected;
              //   },
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: OutlinedButton.icon(
              //     onPressed: () {},
              //     icon: const Icon(FluentIcons.document_add_16_regular),
              //     label: Text('Pilih berkas untuk ditransliterasi',
              //         style:
              //             Theme.of(context).textTheme.titleLarge?.apply(color: Theme.of(context).colorScheme.primary)),
              //     style: ButtonStyle(
              //         padding: const MaterialStatePropertyAll(EdgeInsets.all(32)),
              //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
              //   ),
              // ),
              
              TextField(
                decoration: InputDecoration(
                    hintText: 'Silakan ketik teks yang ingin anda transliterasi di sini',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                    maxLines: 4,
                    autofocus: true,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(FluentIcons.send_20_regular),
                  label: const Text('Proses'),
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                ),
              )
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
                onPressed: () {},
                icon: const Icon(FluentIcons.arrow_right_16_filled),
                label: const Text('Lihat riwayat sebelumnya'),
                style: TextButton.styleFrom(
                    textStyle:
                        Theme.of(context).textTheme.bodyLarge?.merge(const TextStyle(fontWeight: FontWeight.w500)))),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        sliver: SliverList.builder(
            itemCount: 5,
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
    ]));
  }
}
