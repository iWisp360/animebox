import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/series/data/providers/anime_serie.dart';
import 'package:animebox/features/series/data/providers/episodes_sort.dart';
import 'package:animebox/ui/serie/views/serie_view.dart';
import 'package:animebox/ui/utils/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriePageParams {
  final String serieUrl;
  final Server server;
  final String? placeholderImage;
  final AnimeSource source;

  const SeriePageParams({
    required this.serieUrl,
    required this.server,
    required this.source,
    this.placeholderImage,
  });
}

class SeriePage extends ConsumerStatefulWidget {
  final SeriePageParams params;
  const SeriePage({super.key, required this.params});

  @override
  ConsumerState<SeriePage> createState() => _SeriePageState();
}

class _SeriePageState extends ConsumerState<SeriePage> {
  bool _showTitle = false;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      setState(() {
        _showTitle =
            _scrollController.hasClients && _scrollController.offset > 120;
      });
    });

    final SeriePageParams(:serieUrl, :server, :source) = widget.params;
    final provider = animeSerieProvider(
      serieUrl: serieUrl,
      server: server,
      sourceId: source.id,
    );

    final serieQuery = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: serieQuery.maybeWhen(
          orElse: () => null,
          data: (serie) => AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(milliseconds: 100),
            child: Text(serie.name ?? ""),
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),

        child: serieQuery.when(
          data: (serie) {
            final serieEpisodes = (serie.episodes != null)
                ? ref.watch(episodesSortProvider(serie.episodes!))
                : null;

            return Align(
              alignment: .topCenter,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: calculateDefaultPadding(
                    context,
                  ).add(const .symmetric(horizontal: 20)),
                  child: RefreshIndicator(
                    onRefresh: () async => ref.invalidate(provider),
                    child: SerieView(
                      params: widget.params,
                      source: source,
                      serie: serie,
                      episodes: serieEpisodes,
                    ),
                  ),
                ),
              ),
            );
          },
          error: (_, _) => PageInformation(
            message: "This serie failed to load",
            spritesKind: .errorSprite,
            customAction: FilledButton(
              onPressed: () => ref.invalidate(provider, asReload: true),
              child: const Text("Try Again"),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
