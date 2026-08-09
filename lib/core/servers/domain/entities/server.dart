import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.g.dart';
part 'server.freezed.dart';

@freezed
abstract class Server with _$Server {
  const factory Server({
    String? name,
    String? logoUrl,
    @Default("") String url,
    required String uuid,
    required int minCompat,
    required List<AnimeSource> supportedAnimeSources,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}

enum ServerLanguage {
  @JsonValue("EN")
  en,

  @JsonValue("ES")
  es,
}
