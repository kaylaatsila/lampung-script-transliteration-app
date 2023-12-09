import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class Home extends GetView<HomeController> {
  final List<String> entries = <String>['a', 'b', 'c', 'd', 'e'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 26, 
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(FluentIcons.document_add_16_regular),
                  label: const Text('Select file to transliterate'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50, 
                      vertical: 20
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.w500, 
                      fontFamily: 'Google Sans'),
                  )
              )
            ),

            const SizedBox(height: 30),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(FluentIcons.arrow_right_16_filled),
                label: const Text('See previous'),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500, 
                    fontFamily: 'Google Sans'),
                ),
              ),
            ),
            Expanded(
              child: 
              ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: 
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, 
                          vertical: 16
                        ),
                        leading: const Icon(FluentIcons.document_text_16_regular),
                        title: Text('document_${entries[index]}.txt'),
                      ),
                  );
                },
              )
            )
          ],
        ),
      )
    );
  }
}
