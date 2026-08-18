import 'dart:async';

import 'package:animebox/core/servers/data/repositories/server_repository_impl.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/domain/repositories/server_repository.dart';
import 'package:animebox/core/servers/exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServersListProvider extends AsyncNotifier<List<Server>> {
  List<Server>? _serverList;
  final ServerRepository _serverRepository;

  @override
  FutureOr<List<Server>> build() => getServers();

  Future<Server> addServer({required String url}) async {
    try {
      final serverList = state.value ?? [];
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
    try {
      final serverList = state.value ?? [];
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

  Future<List<Server>> getServers() async =>
      _serverList ??= await _serverRepository.getServers();

  Future<void> updateServers() async {
    final currentServers = state.value;
    if (currentServers == null) throw ServersNotInitializedException();

    for (final url in currentServers) {}
  }
}
