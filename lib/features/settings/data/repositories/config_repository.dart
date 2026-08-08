import 'dart:convert';
import 'dart:io';

import 'package:animebox/core/files/data/repositories/config_path_repository.dart';
import 'package:animebox/features/settings/domain/entities/config.dart';
import 'package:animebox/features/settings/domain/repositories/config_repository.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

AnimeBoxConfig _globalConfig = AnimeBoxConfig();
String? _configPath;

class ConfigRepositoryImpl extends ChangeNotifier implements ConfigRepository {
  @override
  void change(AnimeBoxConfig config) {
    _globalConfig = config;
    notifyListeners();
  }

  @override
  AnimeBoxConfig getCurrent() {
    return _globalConfig;
  }

  @override
  Future<void> saveToFile(AnimeBoxConfig config) async {
    String configPath = "";

    if (_configPath == null) {
      final configDirectory = _getConfigDirectory();

      configPath = join((await configDirectory).path, "configuration.json");
      _configPath = configPath;
    }

    final contents = jsonEncode(config.toJson());
    File(_configPath ?? configPath).writeAsString(contents);
  }

  @override
  Future<AnimeBoxConfig> loadFromFile() async {
    String configPath = "";

    if (_configPath == null) {
      final configDirectory = _getConfigDirectory();

      configPath = join((await configDirectory).path, "configuration.json");
      _configPath = configPath;
    }

    if (!await File(_configPath ?? configPath).exists()) {
      saveToFile(_globalConfig);
      return _globalConfig;
    }

    final contents = await File(_configPath ?? configPath).readAsString();
    final json = jsonDecode(contents) as Map<String, dynamic>;

    final newConfig = AnimeBoxConfig.fromJson(json);

    _globalConfig = newConfig;
    notifyListeners();

    return newConfig;
  }

  Future<Directory> _getConfigDirectory() => Platform.isLinux
      ? ConfigPathrepositoryImplLinux().getConfigPath()
      : ConfigPathRepositoryImplFallback().getConfigPath();
}
