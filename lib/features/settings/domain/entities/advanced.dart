import 'package:freezed_annotation/freezed_annotation.dart';

part 'advanced.g.dart';
part 'advanced.freezed.dart';

@freezed
abstract class AdvancedConfig with _$AdvancedConfig {
  const factory AdvancedConfig() = _AdvancedConfig;

  factory AdvancedConfig.fromJson(Map<String, dynamic> json) =>
      _$AdvancedConfigFromJson(json);
}
