import 'dart:async';

import 'package:animebox/core/servers/data/datasources/server_urls.dart';
import 'package:animebox/core/servers/data/repositories/server_repository_impl.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/domain/repositories/server_repository.dart';
import 'package:animebox/core/servers/exceptions.dart';
import 'package:animebox/ui/widgets/global_info_feedback/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServersListProvider extends AsyncNotifier<List<Server>> {
  final ServerRepository _serverRepository;

  @override
  FutureOr<List<Server>> build() async => await _serverRepository.getServers();

  Future<Server> addServer({required String url}) async {
    final serverList = state.requireValue;
    state = const AsyncValue.loading();
    try {
      final server = await _serverRepository.addServerFromEndpoint(url);
      if (!serverList.any(
        (serverFromList) => serverFromList.uuid == server.uuid,
      )) {
        state = AsyncValue.data([...serverList, server]);
      } else {
        throw ExistingServerException(server.uuid);
      }
      return server;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeServer({required String uuid}) async {
    state = const AsyncValue.loading();
    try {
      final serverList = state.requireValue;
      final newList = serverList
          .where((server) => server.uuid != uuid)
          .toList();

      final deleted = await _serverRepository.removeServer(uuid);
      if (deleted) {
        state = AsyncValue.data(newList);
      }

      return deleted;
    } catch (e) {
      rethrow;
    }
  }

  Future<Server?> getServer(String uuid) => _serverRepository.getServer(uuid);
  ServersListProvider({ServerRepository? serverRepository})
    : _serverRepository = serverRepository ?? ServerRepositoryImpl();

  Future<void> updateServers() async {
    final notificationController = ref.read(
      globalNotificationController.notifier,
    );

    final currentServers = state.requireValue;
    state = const AsyncValue.loading();
    notificationController.setState(
      messageBuilder: (i18n, ref) => "Updating servers",
      priority: .info,
    );

    notificationController.set(persistent: true, enabled: true);

    int refreshedServers = 0;
    int failedServers = 0;

    for (final server in currentServers) {
      try {
        await _serverRepository.updateServerFromEndpoint(server.infoUrl());
        refreshedServers++;
      } on Exception {
        failedServers++;
      }
    }

    state = AsyncValue.data(await _serverRepository.getServers());

    if (refreshedServers == 0) {
      notificationController.setState(
        messageBuilder: (i18n, ref) => "All servers failed",
        priority: .error,
      );
    } else {
      notificationController.setState(
        messageBuilder: (i18n, ref) =>
            "$failedServers failed, $refreshedServers refreshed",
        priority: failedServers > 0 ? .warning : .info,
      );
    }

    notificationController.disablePersistence();
  }

  Future<void> resetServerList() async {
    state = const AsyncValue.loading();
    await _serverRepository.resetServerList();
    state = AsyncValue.data(await _serverRepository.getServers());
  }
}
