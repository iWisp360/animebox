import 'package:animebox/core/servers/domain/entities/server.dart';

abstract class ServerRepository {
  Future<void> addServer(Server server);

  /// Returns `true` if the server was present and removed successfully
  Future<bool> removeServer(Server server);
  Future<Server?> getServer(String uuid);
  Future<List<Server>> getServers();
  Future<void> updateServer(Server updatedServer);

  /// Connects to the url, adds the server to the map and returns the server
  Future<Server> addServerFromEndpoint(String url);

  /// Returns true if the the server information changed
  Future<bool> updateServerFromEndpoint(String url);
}
