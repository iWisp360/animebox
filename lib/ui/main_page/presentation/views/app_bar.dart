import 'package:animebox/ui/settings/presentation/views/navigate_to_settings.dart';
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
      icon: const Icon(Icons.search_outlined),
    ),

  if (!isFiltering && showSettingsAction)
    IconButton(
      onPressed: () => navigateToSettings(context),
      icon: const Icon(Icons.settings_outlined),
    ),
];
