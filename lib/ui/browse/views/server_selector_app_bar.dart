import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/presentation/providers/active_server_provider.dart';
import 'package:animebox/core/servers/presentation/providers/servers_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerSelectorOrTitle extends ConsumerWidget {
  const ServerSelectorOrTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeServer = ref.watch(activeServerProvider);
    final serverList = ref.watch(serversListProvider);

    Future<void> changeActiveServer(Server? server) async {
      if (server != null) {
        await ref
            .read(activeServerProvider.notifier)
            .setActiveServer(server.uuid);
      }
    }

    return serverList.maybeWhen(
      data: (servers) {
        final selectedServer = activeServer.maybeWhen(
          data: (server) => server,
          orElse: () => servers.first,
        );

        return SingleChildScrollView(
          scrollDirection: .horizontal,
          child: Row(
            mainAxisSize: .min,
            children: [
              DropdownButton(
                underline: const SizedBox(),
                focusColor: Colors.transparent,
                value: selectedServer,
                items: [
                  for (final server in servers)
                    DropdownMenuItem(
                      value: server,
                      child: Text(server.name ?? server.uuid),
                    ),
                ],
                onChanged: changeActiveServer,
              ),
            ],
          ),
        );
      },
      orElse: () => const Text("Anime Box"),
    );
  }
}
