import 'package:animebox/core/servers/data/extensions/server.dart';
import 'package:animebox/core/servers/presentation/providers/active_server_provider.dart';
import 'package:animebox/ui/browse/views/server_selector_app_bar.dart';
import 'package:animebox/ui/settings/views/server_settings/server_details/server_details_page.dart';
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
    title: const ServerSelectorOrTitle(),
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
                icon: const Icon(Icons.dns_outlined),
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
