import 'dart:async';

import 'package:animebox/core/servers/data/datasources/server_urls.dart';
import 'package:animebox/core/servers/data/repositories/server_repository_impl.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/domain/repositories/server_repository.dart';
import 'package:animebox/core/servers/exceptions.dart';
import 'package:animebox/ui/widgets/global_info_feedback/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServersListProvider extends AsyncNotifier<List<Server>> {
  final ServerRepository _serverRepository;

  @override
  FutureOr<List<Server>> build() async {
    return await _serverRepository.getServers();
  }

  Future<void> modifyServer({required Server server}) async {
    final serverList = [...state.requireValue];

    for (final (idx, s) in serverList.indexed) {
      if (s.uuid == server.uuid) {
        serverList[idx] = server;
      }
    }

    await _serverRepository.updateServer(server);
    state = AsyncValue.data(serverList);
  }

  Future<Server> addServer({required String url}) async {
    final serverList = state.requireValue;

    try {
      final server = await _serverRepository.addServerFromEndpoint(url);
      if (!serverList.any(
        (serverFromList) => serverFromList.uuid == server.uuid,
      )) {
        state = AsyncValue.data([...serverList, server]);
      } else {
        throw ExistingServerException(server.uuid);
      }

      final notifier = ref.read(globalNotificationController.notifier);
      notifier.setState(
        messageBuilder: (i18n, ref) =>
            "Added server ${server.name ?? server.uuid}",
        priority: .info,
      );

      notifier.set(enabled: true);
      return server;
    } catch (e) {
      state = AsyncValue.data(serverList);
      rethrow;
    }
  }

  Future<bool> removeServer({required String uuid}) async {
    final serverList = state.requireValue;
    state = const AsyncValue.loading();

    try {
      final newList = serverList
          .where((server) => server.uuid != uuid)
          .toList();

      final deleted = await _serverRepository.removeServer(uuid);
      if (deleted) {
        state = AsyncValue.data(newList);
      }

      final notifier = ref.read(globalNotificationController.notifier);
      notifier.setState(
        messageBuilder: (i18n, ref) => "Deleted server successfully",
        priority: .info,
      );

      notifier.set(enabled: true);
      return deleted;
    } catch (e) {
      state = AsyncValue.data(serverList);
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

    final totalServers = currentServers.length;

    notificationController.setState(
      messageBuilder: (i18n, ref) => "Updating $totalServers server",
      priority: .info,
      leading: const CircularProgressIndicator(),
    );

    notificationController.set(persistent: true, enabled: true);

    int refreshedServers = 0;
    int failedServers = 0;

    await Future.wait([
      for (final server in currentServers)
        () async {
          try {
            await _serverRepository.updateServerFromEndpoint(server.infoUrl());
            refreshedServers++;
          } on Exception {
            failedServers++;
          }
        }(),
    ]);

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
