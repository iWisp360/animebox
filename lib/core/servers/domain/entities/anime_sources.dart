import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_sources.g.dart';
part 'anime_sources.freezed.dart';

@freezed
abstract class AnimeSource with _$AnimeSource {
  const factory AnimeSource({
    required String prettyName,
    required String id,

    /// The server requested clients to not use metadata providers such as MyAnimeList
    required bool noMetaProvider,
    String? recommendations,
    required bool isHentaiSource,
    required ServerLanguage lang,
  }) = _AnimeSource;

  factory AnimeSource.fromJson(Map<String, dynamic> json) =>
      _$AnimeSourceFromJson(json);
}
