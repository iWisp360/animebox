// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Server _$ServerFromJson(Map<String, dynamic> json) => _Server(
  name: json['name'] as String?,
  logoUrl: json['logoUrl'] as String?,
  url: json['url'] as String?,
  uuid: json['uuid'] as String,
  minCompat: (json['minCompat'] as num).toInt(),
  supportedAnimeSources: (json['supportedAnimeSources'] as List<dynamic>)
      .map((e) => AnimeSource.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ServerToJson(_Server instance) => <String, dynamic>{
  'name': instance.name,
  'logoUrl': instance.logoUrl,
  'url': instance.url,
  'uuid': instance.uuid,
  'minCompat': instance.minCompat,
  'supportedAnimeSources': instance.supportedAnimeSources,
};
