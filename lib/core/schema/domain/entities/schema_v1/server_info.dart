import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_info.g.dart';
part 'server_info.freezed.dart';

@freezed
abstract class ServerInfoV1 with _$ServerInfoV1 {
  const factory ServerInfoV1({
    String? name,
    String? logoUrl,
    required String uuid,
    required String api,
    required List<AnimeSourceV1> supportedAnimeSources,
  }) = _ServerInfoV1;

  factory ServerInfoV1.fromJson(Map<String, dynamic> json) =>
      _$ServerInfoV1FromJson(json);
}

@freezed
abstract class AnimeSourceV1 with _$AnimeSourceV1 {
  const factory AnimeSourceV1({
    required String prettyName,
    required String id,

    /// The server requested clients to not use metadata providers such as MyAnimeList
    required bool noMetaProvider,
    String? recommendations,
    required bool isHentaiSource,
    required ServerLanguageV1 lang,
  }) = _AnimeSourceV1;

  factory AnimeSourceV1.fromJson(Map<String, dynamic> json) =>
      _$AnimeSourceV1FromJson(json);
}

enum ServerLanguageV1 {
  @JsonValue("En")
  en,

  @JsonValue("Es")
  es,
}
