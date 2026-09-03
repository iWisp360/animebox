import 'package:animebox/core/cache/providers/image_cache.dart';
import 'package:animebox/features/series/data/providers/saved_series.dart';
import 'package:animebox/ui/serie/views/serie_page.dart';
import 'package:animebox/ui/utils/anime_card.dart';
import 'package:animebox/ui/utils/anime_card_grid_view.dart';
import 'package:animebox/ui/utils/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LibraryPageView extends ConsumerWidget {
  const LibraryPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedSeries = ref.watch(savedSeriesProvider);

    return savedSeries.when(
      data: (series) => (series.isEmpty)
          ? const PageInformation(message: "No series")
          : AnimeCardGridView(
              builder: (context) => [
                for (final entry in series.entries)
                  AnimeCard(
                    name: entry.value.name ?? entry.key,
                    image: entry.value.image,
                    cacheImage: ref
                        .watch(imageCachePathProvider(entry.value.cacheImage))
                        .whenOrNull(data: (image) => image),
                    onClick: () => context.push(
                      "/serie",
                      extra: SeriePageParams(
                        serverUuid: entry.value.serverUuid,
                        sourceId: entry.value.sourceId,
                        serie: entry.value,
                      ),
                    ),
                  ),
              ],
            ),
      error: (e, st) => PageInformation(
        message: e.toString(),
        customAction: Text(st.toString()),
        spritesKind: .errorSprite,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
