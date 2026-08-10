import 'package:animebox/features/settings/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';

List<Widget> homeAppBarActions(
  BuildContext context, {
  bool showSettingsAction = true,
  required bool isFiltering,
  required Function(bool) filterSetter,
  required bool isOnSearchTab,
}) => [
  if (!isOnSearchTab && !isFiltering)
    IconButton(
      onPressed: () => filterSetter(true),
      icon: const Icon(Icons.search),
    ),

  if (!isFiltering && showSettingsAction)
    IconButton(
      onPressed: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const SettingsPage())),
      icon: const Icon(Icons.settings),
    ),
];
