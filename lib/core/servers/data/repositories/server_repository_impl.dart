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
  }) : serverFileSource = serverFileSource ?? ServerFileSourceImpl(),
       serverRemoteSource = serverRemoteSource ?? ServerRemoteSourceImpl();

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
  Future<bool> removeServer(Server server) async {
    final serverMap = await getCurrent();

    final result = serverMap.remove(server.uuid);
    await serverFileSource.writeToFile(serverMap);

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
  Future<Server> addServerFromEndpoint(String url) async {
    final server = await serverRemoteSource.getFromEndpoint(url);
    await addServer(server);
    return server;
  }

  @override
  Future<bool> updateServerFromEndpoint(String url) async {
    final currentServers = await getCurrent();

    final server = await serverRemoteSource.getFromEndpoint(url);
    final oldServer = currentServers[server.uuid];

    if (oldServer != null && server != oldServer) {
      currentServers[server.uuid] = server;
      await serverFileSource.writeToFile(currentServers);
      return true;
    } else {
      return false;
    }
  }
}
