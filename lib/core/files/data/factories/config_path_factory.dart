import 'dart:io';

import 'package:animebox/core/files/data/repositories/config_path_repository.dart';
import 'package:animebox/core/files/domain/repositories/config_path_repository.dart';

class ConfigPathRepositoryFactory {
  static ConfigPathRepository recommended() => Platform.isLinux
      ? ConfigPathRepositoryImplLinux()
      : ConfigPathRepositoryImplFallback();
}
