import 'package:freezed_annotation/freezed_annotation.dart';

part 'playback.g.dart';
part 'playback.freezed.dart';

@freezed
abstract class PlaybackConfig with _$PlaybackConfig {
  const factory PlaybackConfig() = _PlaybackConfig;

  factory PlaybackConfig.fromJson(Map<String, dynamic> json) =>
      _$PlaybackConfigFromJson(json);
}
