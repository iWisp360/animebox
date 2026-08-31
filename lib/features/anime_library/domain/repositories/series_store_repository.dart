import 'dart:async';

import 'package:animebox/features/anime_library/domain/entities/series_store.dart';

abstract class SeriesStoreRepository {
  Future<SeriesStore> getSeriesStore(Uri path);

  Future<T> access<T>(FnStoreAccess<T> storeAccess, {required Uri path});
}

typedef FnStoreAccess<T> = T Function(SeriesStore store);
