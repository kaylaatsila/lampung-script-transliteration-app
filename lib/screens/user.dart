import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transliteration/controllers/onboarding_controller.dart';
import '../controllers/user_controller.dart';

class User extends GetView<UserController> {
  User({super.key});

  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar.medium(
        title: Text(
          controller.title,
          style: Theme.of(context).textTheme.headlineMedium?.merge(
                const TextStyle(fontWeight: FontWeight.w500),
              ),
        ),
      ),
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(runSpacing: 16, children: [
          DropdownMenu(
            controller: controller.selectedOccupation,
            dropdownMenuEntries: controller.occupationList.map(
              (String occupation) {
                return DropdownMenuEntry(
                    value: occupation,
                    label: occupation,
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(16))));
              },
            ).toList(),
            initialSelection: onboardingController.storedOccupation.value,
            leadingIcon: const Icon(FluentIcons.briefcase_20_filled),
            label: const Text('Pekerjaan'),
            expandedInsets: const EdgeInsets.all(4),
            inputDecorationTheme:
                InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
          ),
          DropdownMenu(
            controller: controller.selectedDomicile,
            dropdownMenuEntries: controller.domicileList.map(
              (String domicile) {
                return DropdownMenuEntry(
                    value: domicile,
                    label: domicile,
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(16))));
              },
            ).toList(),
            initialSelection: onboardingController.storedDomicile.value,
            leadingIcon: const Icon(FluentIcons.building_multiple_20_filled),
            label: const Text('Domisili'),
            expandedInsets: const EdgeInsets.all(4),
            inputDecorationTheme:
                InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: () {
                controller.updateUserData(controller.selectedOccupation.text, controller.selectedDomicile.text);
              },
              icon: const Icon(FluentIcons.save_16_regular),
              label: const Text('Simpan'),
              style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
            ),
          ),
        ]),
      )),
    ]));
  }
}
