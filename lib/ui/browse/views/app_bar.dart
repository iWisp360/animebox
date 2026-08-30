import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/ui/settings/views/navigate_to_settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget browsePageAppBar(
  BuildContext context, {
  required bool activePage,
}) {
  final isDesktop = isDesktopWidth(context);

  return AppBar(
    title: const Text("Anime Box"),
    actions: [
      if (activePage)
        IconButton(
          onPressed: () => context.go("/globalSearch"),
          icon: const Icon(Icons.travel_explore_outlined),
        ),
      if (activePage)
        IconButton(
          onPressed: () => context.push("/settings/servers"),
          icon: const Icon(Icons.dns_outlined),
        ),
      if (!isDesktop)
        IconButton(
          onPressed: () => navigateToSettings(context),
          icon: const Icon(Icons.settings_outlined),
        ),
    ],
  );
}
