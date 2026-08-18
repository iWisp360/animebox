import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:animebox/core/json.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/domain/types.dart';
import 'package:path/path.dart';

abstract class ServerFileSource {
  Future<void> writeToFile(ServerMap servers);
  Future<ServerMap> readFromFile();
}

class ServerFileSourceImpl implements ServerFileSource {
  @override
  Future<void> writeToFile(ServerMap servers) async {
    final jsonServers = servers.map(
      (uuid, server) => MapEntry(uuid, server.toJson()),
    );

    final serialized = prettyEncoder().convert(jsonServers);
    try {
      await File(await _getServersFilePath()).writeAsString(serialized);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ServerMap> readFromFile() async {
    final serverPath = await _getServersFilePath();
    final serverFile = File(serverPath);
    if (!await serverFile.exists()) {
      final ServerMap emptyServers = {};
      await writeToFile(emptyServers);
      return emptyServers;
    }

    final contents = await serverFile.readAsString();
    if (contents.trim().isEmpty) {
      return {};
    }

    final deserialized = jsonDecode(contents) as Map<String, dynamic>;
    return deserialized.map(
      (uuid, server) =>
          MapEntry(uuid, Server.fromJson(server as Map<String, dynamic>)),
    );
  }

  Future<String> _getServersFilePath() async {
    final dataPath = await animeBoxInternalData();

    return join(dataPath.path, "servers.json");
  }

  const ServerFileSourceImpl();
}

abstract class ServersFileDirectory {
  FutureOr<Directory> getDirectory();
}
