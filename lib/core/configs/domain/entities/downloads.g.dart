// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DownloadsConfig _$DownloadsConfigFromJson(Map<String, dynamic> json) =>
    _DownloadsConfig(
      unmeteredNetworksOnly: json['unmeteredNetworksOnly'] as bool? ?? false,
      downloadedEpisodesFormat:
          json['downloadedEpisodesFormat'] as String? ?? "%e %n",
      maxDownloadThreads: (json['maxDownloadThreads'] as num?)?.toInt() ?? 4,
    );

Map<String, dynamic> _$DownloadsConfigToJson(_DownloadsConfig instance) =>
    <String, dynamic>{
      'unmeteredNetworksOnly': instance.unmeteredNetworksOnly,
      'downloadedEpisodesFormat': instance.downloadedEpisodesFormat,
      'maxDownloadThreads': instance.maxDownloadThreads,
    };
