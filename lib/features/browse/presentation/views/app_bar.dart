import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/features/browse/presentation/views/global_search_page_view.dart';
import 'package:animebox/features/browse/presentation/views/server_selector_app_bar.dart';
import 'package:animebox/features/settings/presentation/views/navigate_to_settings.dart';
import 'package:animebox/features/settings/presentation/views/server_settings/navigate_to_server_settings.dart';
import 'package:flutter/material.dart';

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
          onPressed: () => navigateToServerSettings(context),
          icon: const Icon(Icons.dns),
        ),
      if (activePage)
        IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const GlobalSearchPageView(),
            ),
          ),
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
