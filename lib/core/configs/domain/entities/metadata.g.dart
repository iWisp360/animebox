// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetadataConfig _$MetadataConfigFromJson(Map<String, dynamic> json) =>
    _MetadataConfig(
      sourcePreferences:
          (json['sourcePreferences'] as List<dynamic>?)
              ?.map(
                (e) => MetadataSourceConfig.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [
            MetadataSourceConfig(source: .myAnimeList),
            MetadataSourceConfig(source: .aniList),
          ],
    );

Map<String, dynamic> _$MetadataConfigToJson(_MetadataConfig instance) =>
    <String, dynamic>{'sourcePreferences': instance.sourcePreferences};

_MetadataSourceConfig _$MetadataSourceConfigFromJson(
  Map<String, dynamic> json,
) => _MetadataSourceConfig(
  enabled: json['enabled'] as bool? ?? true,
  source: $enumDecode(_$MetadataSourceEnumMap, json['source']),
);

Map<String, dynamic> _$MetadataSourceConfigToJson(
  _MetadataSourceConfig instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'source': _$MetadataSourceEnumMap[instance.source]!,
};

const _$MetadataSourceEnumMap = {
  MetadataSource.myAnimeList: 'myAnimeList',
  MetadataSource.aniList: 'aniList',
};
