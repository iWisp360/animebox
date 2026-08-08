// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalStorageConfig _$LocalStorageConfigFromJson(Map<String, dynamic> json) =>
    _LocalStorageConfig(
      dataPath: json['dataPath'] as String? ?? "%d/AnimeBox",
      deleteWatchedEpisodes: json['deleteWatchedEpisodes'] as bool? ?? false,
      automaticBackups: json['automaticBackups'] as bool? ?? false,
      backupsInterval: (json['backupsInterval'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$LocalStorageConfigToJson(_LocalStorageConfig instance) =>
    <String, dynamic>{
      'dataPath': instance.dataPath,
      'deleteWatchedEpisodes': instance.deleteWatchedEpisodes,
      'automaticBackups': instance.automaticBackups,
      'backupsInterval': instance.backupsInterval,
    };
