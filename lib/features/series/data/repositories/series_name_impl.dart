import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/features/series/domain/repositories/series_name.dart';
import 'package:fuzzy_duplicate_detector/fuzzy_duplicate_detector.dart';
import 'package:uuid/v4.dart';

class SeriesNameImpl implements SeriesName {
  @override
  String normalizeString(String input) =>
      input.replaceAll(" ", "_").replaceAll(":", "").toLowerCase();

  @override
  String generateUniqueKey(Serie serie, AnimeSource source) =>
      "${source.id}:${normalizeString(serie.name ?? const UuidV4().generate())}";

  double compareNames(Serie a, Serie b) {
    final nameA = a.name;
    final nameB = b.name;

    if (nameA == null || nameB == null) {
      return 0;
    }

    return JaroWinkler.similarity(nameA, nameB);
  }
}
