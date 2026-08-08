// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeBoxConfig _$AnimeBoxConfigFromJson(Map<String, dynamic> json) =>
    _AnimeBoxConfig(
      firstRun: json['firstRun'] as bool? ?? true,
      appearance: json['appearance'] == null
          ? const AppearanceConfig()
          : AppearanceConfig.fromJson(
              json['appearance'] as Map<String, dynamic>,
            ),
      metadata: json['metadata'] == null
          ? const MetadataConfig()
          : MetadataConfig.fromJson(json['metadata'] as Map<String, dynamic>),
      downloads: json['downloads'] == null
          ? const DownloadsConfig()
          : DownloadsConfig.fromJson(json['downloads'] as Map<String, dynamic>),
      playback: json['playback'] == null
          ? const PlaybackConfig()
          : PlaybackConfig.fromJson(json['playback'] as Map<String, dynamic>),
      library: json['library'] == null
          ? const LibraryConfig()
          : LibraryConfig.fromJson(json['library'] as Map<String, dynamic>),
      servers: json['servers'] == null
          ? const ServersConfig()
          : ServersConfig.fromJson(json['servers'] as Map<String, dynamic>),
      localStorage: json['localStorage'] == null
          ? const LocalStorageConfig()
          : LocalStorageConfig.fromJson(
              json['localStorage'] as Map<String, dynamic>,
            ),
      advanced: json['advanced'] == null
          ? const AdvancedConfig()
          : AdvancedConfig.fromJson(json['advanced'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeBoxConfigToJson(_AnimeBoxConfig instance) =>
    <String, dynamic>{
      'firstRun': instance.firstRun,
      'appearance': instance.appearance,
      'metadata': instance.metadata,
      'downloads': instance.downloads,
      'playback': instance.playback,
      'library': instance.library,
      'servers': instance.servers,
      'localStorage': instance.localStorage,
      'advanced': instance.advanced,
    };
