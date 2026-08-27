import 'package:animebox/core/servers/data/datasources/server_file_source.dart';
import 'package:animebox/core/servers/data/datasources/server_remote_source.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/domain/exceptions.dart';
import 'package:animebox/core/servers/domain/repositories/server_repository.dart';
import 'package:animebox/core/servers/domain/types.dart';

class ServerRepositoryImpl implements ServerRepository {
  ServerMap? _serverMap;
  ServerFileSource serverFileSource;
  ServerRemoteSource serverRemoteSource;

  ServerRepositoryImpl({
    ServerFileSource? serverFileSource,
    ServerRemoteSource? serverRemoteSource,
  }) : serverFileSource = serverFileSource ?? const ServerFileSourceImpl(),
       serverRemoteSource =
           serverRemoteSource ?? const ServerRemoteSourceImpl();

  Future<ServerMap> getCurrent() async {
    return _serverMap ??= await serverFileSource.readFromFile();
  }

  @override
  Future<void> addServer(Server server) async {
    final serverMap = await getCurrent();

    serverMap[server.uuid] = server;

    await serverFileSource.writeToFile(serverMap);
  }

  @override
  Future<bool> removeServer(String uuid) async {
    final serverMap = await getCurrent();

    final result = serverMap.remove(uuid);
    try {
      await serverFileSource.writeToFile(serverMap);
    } catch (e) {
      rethrow;
    }

    return result != null;
  }

  @override
  Future<Server?> getServer(String uuid) async {
    final serverMap = await getCurrent();
    return serverMap[uuid];
  }

  @override
  Future<List<Server>> getServers() async {
    final serverMap = await getCurrent();
    return serverMap.values.toList();
  }

  @override
  Future<void> updateServer(Server updatedServer) async {
    final serverMap = await getCurrent();
    final targetServer = serverMap[updatedServer.uuid];

    if (targetServer == null) throw MissingServerException(updatedServer.uuid);

    serverMap[updatedServer.uuid] = updatedServer;
    await serverFileSource.writeToFile(serverMap);
  }

  @override
  Future<Server> addServerFromEndpoint(
    String url, {
    bool enableHentai = false,
  }) async {
    final server = await serverRemoteSource.getFromEndpoint(url, enableHentai);
    await addServer(server);
    return server;
  }

  @override
  Future<bool> updateServerFromEndpoint(
    String url, {
    bool enableHentai = false,
  }) async {
    final currentServers = await getCurrent();

    final newServer = await serverRemoteSource.getFromEndpoint(
      url,
      enableHentai,
    );
    final oldServer = currentServers[newServer.uuid];

    if (oldServer != null && newServer != oldServer) {
      final server = mergeSourcesStates(oldServer, newServer);
      currentServers[server.uuid] = server;
      await serverFileSource.writeToFile(currentServers);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> resetServerList() async {
    final newServerMap = _serverMap = {};
    await serverFileSource.writeToFile(newServerMap);
  }

  /// Sources's `enabled` and `toggledManually` states from `a` are passed to `b`
  /// if `toggledManually` is set on the iterated sources.
  ///
  /// Fresh sources from `b` are copied, then we iterate all sources in `a` to copy the states from
  /// the sources in `a` to the sources in `b`.
  Server mergeSourcesStates(Server a, Server b) {
    final newSourcesList = [...b.supportedAnimeSources];

    for (final source in a.supportedAnimeSources) {
      if (source.toggledManually) {
        final targetSourceIdx = b.supportedAnimeSources.indexWhere(
          (s) => s.id == source.id,
        );

        if (targetSourceIdx == -1) continue;

        final targetSource = b.supportedAnimeSources[targetSourceIdx].copyWith(
          enabled: source.enabled,
          toggledManually: source.toggledManually,
        );

        newSourcesList[targetSourceIdx] = targetSource;
      }
    }

    return b.copyWith(supportedAnimeSources: newSourcesList);
  }
}
