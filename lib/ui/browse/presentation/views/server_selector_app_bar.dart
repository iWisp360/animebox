import 'package:animebox/core/servers/data/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerSelectorOrTitle extends ConsumerWidget {
  const ServerSelectorOrTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverList = ref.watch(serverListProvider);
    final activeServer = ref.watch(activeServerProvider);

    if (serverList.isLoading || serverList.value == null) {
      return const CircularProgressIndicator();
    }

    if (serverList.hasError || activeServer.hasError) {
      return title();
    }

    final list = serverList.value ?? [];

    if (list.isEmpty) {
      return title();
    }

    final currentActiveServer = activeServer.value;

    final selectedServer =
        (currentActiveServer != null && list.contains(currentActiveServer))
        ? currentActiveServer
        : list.first;

    return DropdownButton(
      underline: const SizedBox(),
      focusColor: Colors.transparent,
      value: selectedServer,
      items: [
        for (final server in list)
          DropdownMenuItem(
            value: server,
            child: Text(server.name ?? server.uuid),
          ),
      ],
      onChanged: (server) async {
        if (server != null) {
          final provider = ref.read(activeServerProvider.notifier);
          await provider.setActiveServer(server.uuid);
        }
      },
    );
  }

  Widget title() => const Text("Anime Box");
}
