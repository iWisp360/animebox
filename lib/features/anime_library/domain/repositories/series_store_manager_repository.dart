import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/anime_library/domain/repositories/series_store_repository.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';

abstract class SeriesStoreManagerRepository {
  SeriesStoreRepository get storeRepository;
  Future<void> addSerie({
    required Serie serie,
    required Server server,
    required AnimeSource source,
  });

  Future<bool> changeSerie({
    required Serie serie,
    required Server server,
    required AnimeSource source,
  });

  Future<void> removeSerie({
    required Serie serie,
    required Server server,
    required AnimeSource source,
  });
}
