import 'dart:async';
import 'dart:io';

import 'package:animebox/core/configs/data/providers/repository_provider.dart';
import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigProvider extends AsyncNotifier<AnimeBoxConfig> {
  AnimeBoxConfig? _animeBoxConfig;

  @override
  FutureOr<AnimeBoxConfig> build() async {
    return _animeBoxConfig ??= await ref
        .read(configRepositoryProvider)
        .loadFromFile(await _configDirectory);
  }

  Future<void> change(AnimeBoxConfig config) async {
    await saveToFile(config);
    state = AsyncValue.data(config);
  }

  Future<void> saveToFile(AnimeBoxConfig config) async => ref
      .read(configRepositoryProvider)
      .saveToFile(config, await _configDirectory);

  Future<void> loadFromFile() async {
    state = AsyncValue.data(
      await ref
          .read(configRepositoryProvider)
          .loadFromFile(await _configDirectory),
    );
  }

  Future<Directory> get _configDirectory => animeBoxInternalData();
}
