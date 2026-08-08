import 'dart:io';

abstract class ConfigPathRepository {
  Future<Directory> getConfigPath();
}
