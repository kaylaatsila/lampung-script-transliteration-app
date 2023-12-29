import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transliteration/controllers/onboarding_controller.dart';

class Onboarding extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.primaryContainer,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Container(
            padding: const EdgeInsets.all(78),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(controller.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.merge(TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary))),
              // const SizedBox(height: 24),
              // Text(controller.subtitle,
              //     textAlign: TextAlign.center,
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleLarge
              //         ?.merge(TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary))),
              const SizedBox(height: 60),
              Text(controller.body,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.merge(TextStyle(color: Theme.of(context).colorScheme.primary))),
              const SizedBox(height: 16),
              SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        Get.bottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Theme.of(context).colorScheme.background,
                            Padding(
                              padding: const EdgeInsets.all(32),
                              child: Wrap(runSpacing: 16, children: [
                                Text(
                                  'Isi data pengguna',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                DropdownMenu(
                                  controller: controller.selectedOccupation,
                                  dropdownMenuEntries: controller.occupationList.map(
                                    (String occupation) {
                                      return DropdownMenuEntry(
                                          value: occupation,
                                          label: occupation,
                                          style:
                                              const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(16))));
                                    },
                                  ).toList(),
                                  leadingIcon: const Icon(FluentIcons.briefcase_20_filled),
                                  label: const Text('Pekerjaan'),
                                  expandedInsets: const EdgeInsets.all(4),
                                  inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                                ),
                                DropdownMenu(
                                  controller: controller.selectedDomicile,
                                  dropdownMenuEntries: controller.domicileList.map(
                                    (String domicile) {
                                      return DropdownMenuEntry(
                                          value: domicile,
                                          label: domicile,
                                          style:
                                              const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(16))));
                                    },
                                  ).toList(),
                                  leadingIcon: const Icon(FluentIcons.building_multiple_20_filled),
                                  label: const Text('Domisili'),
                                  expandedInsets: const EdgeInsets.all(2),
                                  inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                                ),
                                TextField(
                                  controller: controller.filledReason,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(FluentIcons.pen_20_filled),
                                      labelText: 'Alasan',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: FilledButton.icon(
                                    onPressed: () {
                                      Get.offAllNamed('/MainMenu');
                                      // controller.proceedOnboarding(
                                      //   controller.selectedOccupation.text,
                                      //   controller.selectedDomicile.text,
                                      //   controller.filledReason.text);
                                    },
                                    icon: const Icon(FluentIcons.save_16_regular),
                                    label: const Text('Simpan'),
                                    style: ButtonStyle(
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                                  ),
                                ),
                              ]),
                            ));
                      },
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                      child: const Text('Mulai'))),
            ])),
      ),
    );
  }
}
