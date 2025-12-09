// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) =>
    Chapter(
        identifier: json['identifier'] as String,
        url: json['url'] as String,
        sourceUUID: json['sourceUUID'] as String,
      )
      ..videoUrls = (json['videoUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList();

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
  'identifier': instance.identifier,
  'url': instance.url,
  'videoUrls': instance.videoUrls,
  'sourceUUID': instance.sourceUUID,
};
