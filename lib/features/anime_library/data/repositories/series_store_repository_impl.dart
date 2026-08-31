import 'dart:async';

import 'package:animebox/features/anime_library/data/datasources/series_store_file_source.dart';
import 'package:animebox/features/anime_library/domain/entities/series_store.dart';
import 'package:animebox/features/anime_library/domain/repositories/series_store_repository.dart';

class SeriesStoreRepositoryImpl implements SeriesStoreRepository {
  final SeriesStoreFileSource _storeFileSource = SeriesStoreFileSourceImpl();

  SeriesStore? _cachedStore;

  @override
  Future<SeriesStore> getSeriesStore(Uri path) async =>
      _cachedStore ??= await _storeFileSource.getStoreFromFile(path: path);

  @override
  Future<T> access<T>(FnStoreAccess<T> storeAccess, {required Uri path}) async {
    return storeAccess(await getSeriesStore(path));
  }
}
