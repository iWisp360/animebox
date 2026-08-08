import 'dart:io';

import 'package:animebox/core/files/domain/repositories/config_path_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ConfigPathRepositoryImplFallback implements ConfigPathRepository {
  @override
  Future<Directory> getConfigPath() async {
    final configPath = await getApplicationSupportDirectory();

    if (!await configPath.exists()) {
      await configPath.create();
    }

    return Directory(configPath.path);
  }
}

class ConfigPathRepositoryImplLinux implements ConfigPathRepository {
  @override
  Future<Directory> getConfigPath() async {
    var homeDir = Platform.environment["HOME"];

    final joinedPath = homeDir == null
        ? join((await getApplicationSupportDirectory()).path)
        : join(homeDir, ".animebox");

    final directory = Directory(joinedPath);

    if (!await directory.exists()) {
      await directory.create();
    }

    return directory;
  }
}
