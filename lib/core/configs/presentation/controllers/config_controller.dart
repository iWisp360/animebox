import 'dart:io';

import 'package:animebox/core/configs/data/repositories/config_repository_impl.dart';
import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/configs/domain/repositories/config_repository.dart';
import 'package:animebox/core/files/data/factories/config_path_factory.dart';
import 'package:flutter/material.dart';

class ConfigController extends ChangeNotifier {
  static AnimeBoxConfig _globalConfig = const AnimeBoxConfig();
  final ConfigRepository _configRepository = ConfigRepositoryImpl();
  static final List<Function()> _listeners = [];

  ConfigController() {
    _listeners.add(notifyListeners);
  }

  @override
  void dispose() {
    _listeners.remove(notifyListeners);
    super.dispose();
  }

  void _notifyAll() {
    for (final listener in _listeners) {
      listener();
    }
  }

  void change(AnimeBoxConfig config) {
    _globalConfig = config;
    _notifyAll();
  }

  Future<void> saveToFile() async =>
      _configRepository.saveToFile(current, await _configDirectory);

  Future<AnimeBoxConfig> loadFromFile() async {
    _globalConfig = await _configRepository.loadFromFile(
      await _configDirectory,
    );

    _notifyAll();
    return _globalConfig;
  }

  Future<Directory> get _configDirectory =>
      ConfigPathRepositoryFactory.recommended().getConfigPath();

  AnimeBoxConfig get current => _globalConfig;
}
