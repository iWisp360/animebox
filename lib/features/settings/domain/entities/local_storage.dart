import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_storage.g.dart';
part 'local_storage.freezed.dart';

@freezed
abstract class LocalStorageConfig with _$LocalStorageConfig {
  const factory LocalStorageConfig() = _LocalStorageConfig;

  factory LocalStorageConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalStorageConfigFromJson(json);
}
