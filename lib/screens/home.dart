import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
          title: Text(
                  controller.title,
                  style: Theme.of(context).textTheme.headlineMedium?.merge(
                    const TextStyle(fontWeight: FontWeight.w500))),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(FluentIcons.document_add_16_regular),
                      label: Text('Select file to transliterate',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                            color: Theme.of(context).colorScheme.primary)),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(FluentIcons.arrow_right_16_filled),
                        label: const Text('See previous results'),
                        style: TextButton.styleFrom(
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge?.merge(
                                  const TextStyle(fontWeight: FontWeight.w500)))),
                  ),
                )
              ],
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            sliver: SliverList.builder(
              itemCount: 3,
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
              }
            ),
          )
        ]
      )
    );
  }
}
