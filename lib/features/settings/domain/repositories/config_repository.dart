import 'package:animebox/features/settings/domain/entities/config.dart';
import 'package:flutter/material.dart';

abstract interface class ConfigRepository extends ChangeNotifier {
  Future<void> saveToFile(final AnimeBoxConfig config);
  Future<AnimeBoxConfig> loadFromFile();
  void change(final AnimeBoxConfig config);
  AnimeBoxConfig getCurrent();
}
