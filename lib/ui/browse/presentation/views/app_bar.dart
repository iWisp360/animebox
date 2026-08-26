import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/ui/browse/presentation/views/server_selector_app_bar.dart';
import 'package:animebox/ui/settings/presentation/views/navigate_to_settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget globalSearchPageAppBar(BuildContext context) {
  return AppBar(
    title: const ServerSelectorOrTitle(),
    actions: [
      IconButton(onPressed: () => (), icon: const Icon(Icons.search)),
      IconButton(
        onPressed: () => navigateToSettings(context),
        icon: const Icon(Icons.settings),
      ),
    ],
  );
}

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
          onPressed: () => context.push("/settings/servers"),
          icon: const Icon(Icons.dns),
        ),
      if (activePage)
        IconButton(
          onPressed: () => context.go("/globalSearch"),
          icon: const Icon(Icons.travel_explore),
        ),
      if (!isDesktop)
        IconButton(
          onPressed: () => navigateToSettings(context),
          icon: const Icon(Icons.settings),
        ),
    ],
  );
}
