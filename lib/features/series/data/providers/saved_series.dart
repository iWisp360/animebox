import 'dart:convert';

import 'package:animebox/core/global_info_feedback/providers.dart';
import 'package:animebox/core/servers/domain/exceptions.dart';
import 'package:animebox/core/servers/presentation/providers/server_provider.dart';
import 'package:animebox/features/local_storage/providers/database.dart';
import 'package:animebox/features/series/data/providers/series_name.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:collection/collection.dart';
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

    try {
      _savedSeriesCache ??= (db.readTableValues(_seriesTable)).map(
        (k, v) =>
            MapEntry(k, Serie.fromJson(jsonDecode(v) as Map<String, dynamic>)),
      );
    } catch (e) {
      final notifier = ref.read(globalNotificationProvider.notifier);
      notifier.setState(
        messageBuilder: (i18n, ref) => "Your series library seems corrupted",
        priority: .error,
      );

      notifier.toggle();
      rethrow;
    }

    return _savedSeriesCache!;
  }

  Future<void> addSerie(Serie serie) async {
    final serieServer = await ref.read(serverProvider(serie.serverUuid).future);

    if (serieServer == null) throw MissingServerException(serie.serverUuid);
    final serieSource = serieServer.supportedAnimeSources.firstWhereOrNull(
      (s) => s.id == serie.sourceId,
    );

    if (serieSource == null) throw MissingSourceException(serie.sourceId);
    final db = await ref.read(databaseProvider.future);

    final currentSeries = {...state.requireValue};
    final newKey = ref
        .read(seriesNameProvider)
        .generateUniqueKey(serie, serieSource);

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
