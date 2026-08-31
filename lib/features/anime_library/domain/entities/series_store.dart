import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_store.freezed.dart';
part 'series_store.g.dart';

@freezed
abstract class SeriesStore with _$SeriesStore {
  const factory SeriesStore({
    required Map<String, StoredSeriesSourceMap> sources,
  }) = _SeriesStore;

  factory SeriesStore.fromJson(Map<String, dynamic> json) =>
      _$SeriesStoreFromJson(json);
}

@freezed
abstract class StoredSeriesSourceMap with _$StoredSeriesSourceMap {
  const factory StoredSeriesSourceMap({
    required Map<String, List<Serie>> series,
  }) = _ServerSeries;

  factory StoredSeriesSourceMap.fromJson(Map<String, dynamic> json) =>
      _$StoredSeriesSourceMapFromJson(json);
}
