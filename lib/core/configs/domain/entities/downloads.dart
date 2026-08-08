import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloads.g.dart';
part 'downloads.freezed.dart';

@freezed
abstract class DownloadsConfig with _$DownloadsConfig {
  const factory DownloadsConfig() = _DownloadsConfig;

  factory DownloadsConfig.fromJson(Map<String, dynamic> json) =>
      _$DownloadsConfigFromJson(json);
}
