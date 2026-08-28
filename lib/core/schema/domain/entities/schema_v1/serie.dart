import 'package:animebox/core/schema/domain/entities/schema_v1/episodes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'serie.freezed.dart';
part 'serie.g.dart';

@Freezed(toJson: false)
abstract class SerieV1 with _$SerieV1 {
  const factory SerieV1({
    String? name,
    String? image,
    String? description,
    @JsonKey(name: "chapters") List<EpisodeV1>? episodes,
  }) = _SerieV1;

  factory SerieV1.fromJson(Map<String, dynamic> json) =>
      _$SerieV1FromJson(json);
}

@Freezed(fromJson: false, toJson: true)
abstract class SerieVariablesV1 with _$SerieVariablesV1 {
  const factory SerieVariablesV1({
    required String serieUrl,
    required String sourceId,
  }) = _SerieVariablesV1;
}

const String serieQueryV1 = """
  query Serie(\$sourceId: String!, \$serieUrl: String!) { 
    Serie(sourceId: \$sourceId, serieUrl: \$serieUrl) { 
      name 
      image 
      description 
      chapters { url num name } 
    }
  }
""";
