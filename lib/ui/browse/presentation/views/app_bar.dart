import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/servers/data/extensions/server.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/ui/browse/presentation/views/server_selector_app_bar.dart';
import 'package:animebox/ui/settings/presentation/views/navigate_to_settings.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/server_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget globalSearchPageAppBar({
  required BuildContext context,
  required WidgetRef ref,
  required Color gradientColor,
}) {
  final activeServer = ref.watch(activeServerProvider);

  return AppBar(
    title: ServerSelectorOrTitle(activeServer: activeServer),
    actions: [
      activeServer.when(
        data: (server) => Row(
          children: [
            if (server.enabledSources() != 0)
              IconButton(
                onPressed: () => context.push(
                  "/settings/servers/details",
                  extra: ServerDetailsPageParams(
                    serverUuid: server.uuid,
                    canDelete: false,
                  ),
                ),
                icon: const Icon(Icons.settings),
              ),
          ],
        ),
        error: (_, _) => const Icon(Icons.broken_image),
        loading: () => const CircularProgressIndicator(),
      ),
    ],
    backgroundColor: gradientColor,
    scrolledUnderElevation: 0,
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
          onPressed: () => context.go("/globalSearch"),
          icon: const Icon(Icons.travel_explore),
        ),
      if (activePage)
        IconButton(
          onPressed: () => context.push("/settings/servers"),
          icon: const Icon(Icons.dns),
        ),
      if (!isDesktop)
        IconButton(
          onPressed: () => navigateToSettings(context),
          icon: const Icon(Icons.settings),
        ),
    ],
  );
}
