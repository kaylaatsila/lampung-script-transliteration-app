import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

enum OccupationLabel {
  student('Student', FluentIcons.book_20_filled),
  teacher('Teacher', FluentIcons.presenter_20_filled),
  researcher('Researcher', FluentIcons.beaker_20_filled);

  const OccupationLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

enum DomicileLabel {
  lampung('Lampung'),
  southSumatera('South Sumatera');

  const DomicileLabel(this.label);
  final String label;
}

class User extends GetView<UserController> {
  String? selectedOccupation = '';
  String? selectedDomicile = '';

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          DropdownMenu(
            dropdownMenuEntries: OccupationLabel.values.map<DropdownMenuEntry<OccupationLabel>>(
              (OccupationLabel occupation) {
                return DropdownMenuEntry<OccupationLabel>(
                    value: occupation,
                    label: occupation.label,
                    leadingIcon: Icon(occupation.icon),
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(16))));
              },
            ).toList(),
            leadingIcon: const Icon(FluentIcons.briefcase_20_filled),
            label: const Text('Occupation'),
            expandedInsets: EdgeInsets.all(4),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          DropdownMenu(
            dropdownMenuEntries: DomicileLabel.values.map<DropdownMenuEntry<DomicileLabel>>(
              (DomicileLabel domicile) {
                return DropdownMenuEntry<DomicileLabel>(
                    value: domicile,
                    label: domicile.label,
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(16))));
              },
            ).toList(),
            leadingIcon: const Icon(FluentIcons.building_multiple_20_filled),
            label: const Text('Domicile'),
            expandedInsets: EdgeInsets.all(4),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: null,
              icon: const Icon(FluentIcons.save_16_regular),
              label: const Text('Save')),
          )
        ]),
      )),
    ]));
  }
}
