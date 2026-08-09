import 'dart:convert';
import 'dart:io';

import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/configs/domain/repositories/config_repository.dart';
import 'package:animebox/core/files/data/repositories/files_repository.dart';
import 'package:animebox/core/json.dart';
import 'package:path/path.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  final filesRepository = FilesRepositoryImpl();

  @override
  Future<void> saveToFile(
    AnimeBoxConfig config,
    Directory configDirectory,
  ) async {
    await filesRepository.ensureDirectory(configDirectory);

    final contents = prettyEncoder().convert(config.toJson());
    final configPath = _configPath(configDirectory);
    await filesRepository.writeToFile(configPath, contents);
  }

  @override
  Future<AnimeBoxConfig> loadFromFile(Directory configDirectory) async {
    String configPath = _configPath(configDirectory);

    if (!await File(configPath).exists()) {
      const defaultConfig = AnimeBoxConfig();
      await saveToFile(defaultConfig, configDirectory);
      return defaultConfig;
    }

    final contents = await filesRepository.readFromFile(configPath);
    final json = jsonDecode(contents) as Map<String, dynamic>;

    final newConfig = AnimeBoxConfig.fromJson(json);

    return newConfig;
  }

  String _configPath(Directory configDirectory) =>
      join(configDirectory.path, "configuration.json");
}
