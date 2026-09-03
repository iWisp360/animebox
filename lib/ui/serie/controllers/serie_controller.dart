import 'package:animebox/core/cache/providers/image_cache.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/series/data/providers/saved_series.dart';
import 'package:animebox/features/series/data/providers/series_name.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/serie/controllers/image_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerieController {
  const SerieController();

  Future<void> saveSerie({
    required WidgetRef ref,
    ImageController imageController = const ImageController(),
    required Serie serie,
    String? placeholderImage,
    required AnimeSource source,
  }) async {
    final imageData = await imageController.fetchSerieOrPlaceholder(
      ref,
      serie,
      placeholderImage: placeholderImage,
    );

    String? fullFileName = serie.cacheImage;

    if (imageData != null && fullFileName == null) {
      final seriesName = ref.read(seriesNameProvider);

      final fileName = seriesName.normalizeString(
        seriesName.generateUniqueKey(serie, source),
      );

      fullFileName = await ref.read(
        imageToCacheProvider(fileName, imageData).future,
      );
    }

    await ref
        .read(savedSeriesProvider.notifier)
        .addSerie(serie.copyWith(cacheImage: fullFileName), source);
  }
}
