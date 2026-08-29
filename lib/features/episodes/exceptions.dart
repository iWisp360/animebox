import 'package:animebox/features/series/domain/entities/serie.dart';

class EpisodeNoNumException implements Exception {
  final Serie serie;
  const EpisodeNoNumException(this.serie);
}
