import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/series/data/providers/saved_series.dart';
import 'package:animebox/features/series/data/providers/series_name.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'serie_watch.g.dart';

@riverpod
({String key, Serie serie})? serieWatch(
  Ref ref,
  Serie serie,
  AnimeSource source,
) {
  final savedSeries = ref.watch(savedSeriesProvider);

  final key = ref.read(seriesNameProvider).generateUniqueKey(serie, source);
  return savedSeries.maybeWhen(
    orElse: () => null,
    data: (series) {
      final serie = series[key];
      return (serie != null) ? (key: key, serie: serie) : null;
    },
  );
}
