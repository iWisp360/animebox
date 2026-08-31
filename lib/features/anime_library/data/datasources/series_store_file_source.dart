import 'package:animebox/features/anime_library/domain/entities/series_store.dart';

abstract class SeriesStoreFileSource {
  Future<SeriesStore> getStoreFromFile({required Uri path});
  Future<void> writeStoreToFile(SeriesStore store, {required Uri path});
}

class SeriesStoreFileSourceImpl implements SeriesStoreFileSource {
  @override
  Future<SeriesStore> getStoreFromFile({required Uri path}) {
    throw UnimplementedError();
  }

  @override
  Future<void> writeStoreToFile(SeriesStore store, {required Uri path}) {
    throw UnimplementedError();
  }
}
