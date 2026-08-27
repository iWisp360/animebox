import 'dart:async';

import 'package:animebox/core/servers/domain/entities/server.dart';

abstract class ServerRepository {
  Future<void> addServer(Server server);

  /// Returns `true` if the server was present and removed successfully
  Future<bool> removeServer(String uuid);
  Future<Server?> getServer(String uuid);
  FutureOr<List<Server>> getServers();
  Future<void> updateServer(Server updatedServer);

  /// Connects to the url, adds the server to the map and returns the server
  Future<Server> addServerFromEndpoint(String url, {bool enableHentai = false});

  /// Returns true if the the server information changed
  Future<bool> updateServerFromEndpoint(
    String url, {
    bool enableHentai = false,
  });

  /// Resets the server list. Use only in emergencies!!!
  Future<void> resetServerList();
}
