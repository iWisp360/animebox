import 'dart:async';

import 'package:animebox/core/injector.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/presentation/providers/servers_list_provider.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_server_provider.g.dart';

@Riverpod(keepAlive: true)
class ActiveServer extends _$ActiveServer {
  String? _activeServer;

  @override
  FutureOr<Server> build() async {
    final serverList = await ref.watch(serversListProvider.future);
    try {
      _activeServer ??= ref
          .read(sharedPreferencesProvider)
          .getString("activeServer");
    } catch (e) {
      return serverList.first;
    }

    return serverList.firstWhereOrNull(
          (server) => server.uuid == _activeServer,
        ) ??
        serverList.first;
  }

  Future<void> setActiveServer(String uuid) async {
    final serverList = ref.read(serversListProvider.notifier);

    final server = await serverList.getServer(uuid);
    if (server != null) {
      state = AsyncValue.data(server);
      await ref.read(sharedPreferencesProvider).setString("activeServer", uuid);
      _activeServer = uuid;
    }
  }
}
