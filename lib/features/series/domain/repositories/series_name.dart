import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';

abstract class SeriesName {
  String normalizeString(String input);
  String generateUniqueKey(Serie serie, AnimeSource source);
}
