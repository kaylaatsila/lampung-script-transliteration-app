import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> entries = <String>['a', 'b', 'c', 'd', 'e'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 32.0, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(FluentIcons.add_16_filled),
                    label: const Text('Upload file'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Google Sans'),
                    ))),
            const SizedBox(height: 30.0),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(FluentIcons.arrow_right_16_filled),
                label: const Text('See recent'),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'Google Sans'),
                  // splashFactory: NoSplash.splashFactory,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 64.0,
                    alignment: Alignment.centerLeft,
                    child: Text('document_${entries[index]}.txt'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              )
            )
          ],
        ),
      )
    );
  }
}
