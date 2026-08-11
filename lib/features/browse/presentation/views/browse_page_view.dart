import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/core/widgets/page_information.dart';
import 'package:animebox/features/settings/presentation/views/server_settings/servers_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrowsePageView extends ConsumerWidget {
  const BrowsePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchedServers = ref.watch(serverListProvider);

    return watchedServers.when(
      data: (servers) => (servers.isEmpty)
          ? PageInformation(
              message:
                  "There are currently no servers. Add one in the servers settings.",
              customAction: FilledButton.tonal(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ServersSettingsPage(),
                  ),
                ),
                child: const Text("Go to servers"),
              ),
            )
          : Center(child: Text("$servers")),
      error: (exception, st) => PageInformation(message: exception.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
