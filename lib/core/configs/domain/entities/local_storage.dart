import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_storage.g.dart';
part 'local_storage.freezed.dart';

@freezed
abstract class LocalStorageConfig with _$LocalStorageConfig {
  const factory LocalStorageConfig({
    String? dataPath,
    @Default(false) bool deleteWatchedEpisodes,
    @Default(false) bool automaticBackups,

    /// Interval of backups in hours when `automaticBackups` is `true`
    @Default(3) int backupsInterval,
  }) = _LocalStorageConfig;

  factory LocalStorageConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalStorageConfigFromJson(json);
}
