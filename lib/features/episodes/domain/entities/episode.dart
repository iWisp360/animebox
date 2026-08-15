import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required String serverUuid,
    required String url,
    required String sourceId,
    required int num,
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
