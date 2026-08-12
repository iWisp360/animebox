import 'package:animebox/ui/metadata/domain/entities/metadata_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.g.dart';
part 'metadata.freezed.dart';

@freezed
abstract class MetadataConfig with _$MetadataConfig {
  const factory MetadataConfig({
    @Default([
      MetadataSourceConfig(source: .myAnimeList),
      MetadataSourceConfig(source: .aniList),
    ])
    List<MetadataSourceConfig> sourcePreferences,
  }) = _MetadataConfig;

  factory MetadataConfig.fromJson(Map<String, dynamic> json) =>
      _$MetadataConfigFromJson(json);
}

@freezed
abstract class MetadataSourceConfig with _$MetadataSourceConfig {
  const factory MetadataSourceConfig({
    @Default(true) bool enabled,
    required MetadataSource source,
  }) = _MetadataSourceConfig;

  factory MetadataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$MetadataSourceConfigFromJson(json);
}
