// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
  identifier: json['identifier'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
  'identifier': instance.identifier,
  'url': instance.url,
};

Serie _$SerieFromJson(Map<String, dynamic> json) => Serie(
  name: json['name'] as String,
  url: json['url'] as String,
  description: json['description'] as String?,
  chapters: (json['chapters'] as List<dynamic>)
      .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
      .toList(),
  sourceUUID: json['sourceUUID'] as String,
);

Map<String, dynamic> _$SerieToJson(Serie instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
  'description': instance.description,
  'chapters': instance.chapters,
  'sourceUUID': instance.sourceUUID,
};
