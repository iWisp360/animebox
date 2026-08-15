import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloads.g.dart';
part 'downloads.freezed.dart';

@freezed
abstract class DownloadsConfig with _$DownloadsConfig {
  const factory DownloadsConfig({
    @Default(false) bool unmeteredNetworksOnly,
    @Default("%E %n") String downloadedEpisodesFormat,
    @Default(4) int maxDownloadThreads,
    @Default(3) int maxConcurrentDownloads,
  }) = _DownloadsConfig;

  factory DownloadsConfig.fromJson(Map<String, dynamic> json) =>
      _$DownloadsConfigFromJson(json);
}
