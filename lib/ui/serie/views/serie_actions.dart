import 'package:animebox/core/global_info_feedback/providers.dart';
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
          enabled: serieState != null,
          icon: const Icon(Icons.favorite_outlined),
          title: (source == null)
              ? "Local Serie Only"
              : (serieState == null)
              ? "Add to Library"
              : "Remove from Library",
          action: (source == null)
              ? null
              : (context) async {
                  try {
                    (serieState == null)
                        ? await ref
                              .read(savedSeriesProvider.notifier)
                              .addSerie(serie)
                        : await ref
                              .read(savedSeriesProvider.notifier)
                              .removeSerie(serieState.key);
                  } catch (e, st) {
                    final notifier = ref.read(
                      globalNotificationProvider.notifier,
                    );

                    debugPrint("$e\n$st");

                    notifier.setState(
                      messageBuilder: (i18n, ref) => "Could not add this serie",
                      priority: .error,
                    );

                    notifier.toggle();
                  }
                },
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool enabled;
  final Function(BuildContext context)? action;
  const _ActionButton({
    required this.icon,
    required this.title,
    required this.enabled,
    this.action,
  });

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
                    color: enabled
                        ? ColorScheme.of(context).primary
                        : ColorScheme.of(context).onSurfaceVariant,
                  ),
                  child: icon,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: enabled
                        ? ColorScheme.of(context).primary
                        : ColorScheme.of(context).onSurfaceVariant,
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
