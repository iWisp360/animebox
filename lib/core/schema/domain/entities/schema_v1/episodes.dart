import 'package:freezed_annotation/freezed_annotation.dart';

part 'episodes.freezed.dart';
part 'episodes.g.dart';

@Freezed(toJson: false)
abstract class EpisodeV1 with _$EpisodeV1 {
  const factory EpisodeV1({String? name, int? num, String? url}) = _EpisodeV1;

  factory EpisodeV1.fromJson(Map<String, dynamic> json) =>
      _$EpisodeV1FromJson(json);
}
