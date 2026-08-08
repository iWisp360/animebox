// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdvancedConfig _$AdvancedConfigFromJson(
  Map<String, dynamic> json,
) => _AdvancedConfig(
  debugLogs: json['debugLogs'] as bool? ?? false,
  userAgent:
      json['userAgent'] as String? ??
      "Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0",
);

Map<String, dynamic> _$AdvancedConfigToJson(_AdvancedConfig instance) =>
    <String, dynamic>{
      'debugLogs': instance.debugLogs,
      'userAgent': instance.userAgent,
    };
