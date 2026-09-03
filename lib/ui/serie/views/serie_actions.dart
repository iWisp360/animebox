import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/presentation/providers/source_provider.dart';
import 'package:animebox/features/series/data/providers/saved_series.dart';
import 'package:animebox/features/series/data/providers/serie_watch.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/serie/views/serie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerieActions extends ConsumerWidget {
  final Serie serie;
  final AnimeSource? source;
  final SeriePageParams params;
  const SerieActions({
    super.key,
    required this.serie,
    required this.params,
    this.source,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providedSource = ref.watch(animeSourceProvider(serie.sourceId));

    final source = providedSource.whenOrNull(data: (s) => s);

    final serieState = (source == null)
        ? null
        : ref.watch(serieWatchProvider(serie, source));

    return Row(
      children: [
        _ActionButton(
          icon: const Icon(Icons.favorite_outlined),
          title: (source == null)
              ? "Local Serie Only"
              : (serieState == null)
              ? "Add to Library"
              : "Remove from Library",
          action: (source == null)
              ? null
              : (context) async {
                  (serieState == null)
                      ? throw UnimplementedError()
                      : await ref
                            .read(savedSeriesProvider.notifier)
                            .removeSerie(serieState.key);
                },
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function(BuildContext context)? action;
  const _ActionButton({required this.icon, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => action?.call(context),
          child: SizedBox(
            width: 100,
            height: 70,
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                IconTheme(
                  data: IconThemeData(
                    color: ColorScheme.of(context).onSurfaceVariant,
                  ),
                  child: icon,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: ColorScheme.of(context).onSurfaceVariant,
                  ),
                  textAlign: .center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
