// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryConfig _$LibraryConfigFromJson(Map<String, dynamic> json) =>
    _LibraryConfig(
      customCategories:
          (json['customCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      defaultCategory: json['defaultCategory'] as String?,
    );

Map<String, dynamic> _$LibraryConfigToJson(_LibraryConfig instance) =>
    <String, dynamic>{
      'customCategories': instance.customCategories,
      'defaultCategory': instance.defaultCategory,
    };

_LibraryAutoUpdateConfig _$LibraryAutoUpdateConfigFromJson(
  Map<String, dynamic> json,
) => _LibraryAutoUpdateConfig(
  enable: json['enable'] as bool? ?? false,
  interval: (json['interval'] as num?)?.toInt() ?? 6,
  allowMobileData: json['allowMobileData'] as bool? ?? false,
  avoidWatchedSeries: json['avoidWatchedSeries'] as bool? ?? true,
  avoidCompletedSeries: json['avoidCompletedSeries'] as bool? ?? true,
);

Map<String, dynamic> _$LibraryAutoUpdateConfigToJson(
  _LibraryAutoUpdateConfig instance,
) => <String, dynamic>{
  'enable': instance.enable,
  'interval': instance.interval,
  'allowMobileData': instance.allowMobileData,
  'avoidWatchedSeries': instance.avoidWatchedSeries,
  'avoidCompletedSeries': instance.avoidCompletedSeries,
};
