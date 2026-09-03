import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
abstract class Episode with _$Episode {
  const Episode._();

  const factory Episode({
    required String serverUuid,
    required String sourceId,
    String? url,
    int? num,
    String? name,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  factory Episode.test() => const Episode(
    serverUuid: "",
    url: "",
    sourceId: "",
    name: "Big Buck Bunny",
    num: 1,
  );
}

@freezed
abstract class EpisodeVideos with _$EpisodeVideos {
  const factory EpisodeVideos({required List<String> videos}) = _EpisodeVideos;

  factory EpisodeVideos.fromJson(Map<String, dynamic> json) =>
      _$EpisodeVideosFromJson(json);
}
