import 'package:animebox/core/configs/domain/entities/advanced.dart';
import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/core/configs/domain/entities/downloads.dart';
import 'package:animebox/core/configs/domain/entities/library.dart';
import 'package:animebox/core/configs/domain/entities/local_storage.dart';
import 'package:animebox/core/configs/domain/entities/metadata.dart';
import 'package:animebox/core/configs/domain/entities/playback.dart';
import 'package:animebox/core/configs/domain/entities/servers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.g.dart';
part 'config.freezed.dart';

@freezed
abstract class AnimeBoxConfig with _$AnimeBoxConfig {
  const factory AnimeBoxConfig({
    @Default(true) bool firstRun,
    @Default(AppearanceConfig()) AppearanceConfig appearance,
    @Default(MetadataConfig()) MetadataConfig metadata,
    @Default(DownloadsConfig()) DownloadsConfig downloads,
    @Default(PlaybackConfig()) PlaybackConfig playback,
    @Default(LibraryConfig()) LibraryConfig library,
    @Default(ServersConfig()) ServersConfig servers,
    @Default(LocalStorageConfig()) LocalStorageConfig localStorage,
    @Default(AdvancedConfig()) AdvancedConfig advanced,
  }) = _AnimeBoxConfig;

  factory AnimeBoxConfig.fromJson(Map<String, dynamic> json) =>
      _$AnimeBoxConfigFromJson(json);
}
