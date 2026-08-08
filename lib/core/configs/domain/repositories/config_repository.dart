import 'dart:io';

import 'package:animebox/core/configs/domain/entities/config.dart';

abstract interface class ConfigRepository {
  Future<void> saveToFile(AnimeBoxConfig config, Directory configDirectory);
  Future<AnimeBoxConfig> loadFromFile(Directory configDirectory);
}
