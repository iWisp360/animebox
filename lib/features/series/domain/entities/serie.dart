import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'serie.freezed.dart';
part 'serie.g.dart';

@freezed
abstract class Serie with _$Serie {
  const factory Serie({
    String? name,
    String? image,
    String? cacheImage,
    String? description,
    List<Episode>? episodes,
    required String sourceId,
    required String serverUuid,
  }) = _Serie;

  factory Serie.fromJson(Map<String, dynamic> json) => _$SerieFromJson(json);
}
