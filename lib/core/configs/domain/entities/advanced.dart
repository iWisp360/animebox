import 'package:freezed_annotation/freezed_annotation.dart';

part 'advanced.g.dart';
part 'advanced.freezed.dart';

@freezed
abstract class AdvancedConfig with _$AdvancedConfig {
  const factory AdvancedConfig({
    @Default(false) bool debugLogs,
    @Default(
      "Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0",
    )
    String userAgent,
  }) = _AdvancedConfig;

  factory AdvancedConfig.fromJson(Map<String, dynamic> json) =>
      _$AdvancedConfigFromJson(json);
}
