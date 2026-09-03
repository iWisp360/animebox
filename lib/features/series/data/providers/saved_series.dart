import 'dart:convert';

import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/local_storage/providers/database.dart';
import 'package:animebox/features/series/data/providers/series_name.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_series.g.dart';

@Riverpod(keepAlive: true)
class SavedSeries extends _$SavedSeries {
  String get _seriesTable => "series";
  Map<String, Serie>? _savedSeriesCache;

  @override
  FutureOr<Map<String, Serie>> build() async {
    final db = await ref.read(databaseProvider.future);
    if (!db.initialized) {
      db.initialize();
    }

    return _savedSeriesCache ??= (db.readTableValues(_seriesTable)).map(
      (k, v) =>
          MapEntry(k, Serie.fromJson(jsonDecode(v) as Map<String, dynamic>)),
    );
  }

  Future<void> addSerie(Serie serie, AnimeSource source) async {
    final db = await ref.read(databaseProvider.future);

    final currentSeries = {...state.requireValue};
    final newKey = ref
        .read(seriesNameProvider)
        .generateUniqueKey(serie, source);

    currentSeries[newKey] = serie;
    state = .data(currentSeries);

    db.writeValue(
      key: newKey,
      value: jsonEncode(serie.toJson()),
      table: _seriesTable,
    );
  }

  Future<void> removeSerie(String key) async {
    final db = await ref.read(databaseProvider.future);

    final currentSeries = {...state.requireValue};
    currentSeries.remove(key);

    state = .data(currentSeries);

    db.removeValue(key: key, table: _seriesTable);
  }
}
