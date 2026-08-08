import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.g.dart';
part 'metadata.freezed.dart';

@freezed
abstract class MetadataConfig with _$MetadataConfig {
  const factory MetadataConfig() = _MetadataConfig;

  factory MetadataConfig.fromJson(Map<String, dynamic> json) =>
      _$MetadataConfigFromJson(json);
}
