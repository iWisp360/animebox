import 'dart:async';
import 'dart:io';

import 'package:animebox/core/configs/data/repositories/config_repository_impl.dart';
import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/configs/domain/repositories/config_repository.dart';
import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';

@Riverpod(keepAlive: true)
ConfigRepository configRepository(Ref ref) => ConfigRepositoryImpl();

@Riverpod(keepAlive: true)
class Config extends _$Config {
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
