// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeSource _$AnimeSourceFromJson(Map<String, dynamic> json) => _AnimeSource(
  prettyName: json['prettyName'] as String,
  id: json['id'] as String,
  noMetaProvider: json['noMetaProvider'] as bool,
  recommendations: json['recommendations'] as String?,
  isHentaiSource: json['isHentaiSource'] as bool,
  lang: $enumDecode(_$ServerLanguageEnumMap, json['lang']),
);

Map<String, dynamic> _$AnimeSourceToJson(_AnimeSource instance) =>
    <String, dynamic>{
      'prettyName': instance.prettyName,
      'id': instance.id,
      'noMetaProvider': instance.noMetaProvider,
      'recommendations': instance.recommendations,
      'isHentaiSource': instance.isHentaiSource,
      'lang': _$ServerLanguageEnumMap[instance.lang]!,
    };

const _$ServerLanguageEnumMap = {
  ServerLanguage.en: 'EN',
  ServerLanguage.es: 'ES',
};
