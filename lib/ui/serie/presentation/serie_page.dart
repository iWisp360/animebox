import 'dart:typed_data';

import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/network/image_provider.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/series/data/providers/episodes_sort_provider.dart';
import 'package:animebox/features/series/data/providers/serie_provider.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/widgets/end_scrolled_view_padding.dart';
import 'package:animebox/ui/widgets/page_information.dart';
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
    final provider = serieProvider((serieUrl, server, source.id));
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
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .start,
                      children: [
                        SerieInformation(
                          params: widget.params,
                          serie: serie,
                          source: source,
                        ),

                        (serie.description != null)
                            ? Column(
                                crossAxisAlignment: .start,
                                children: [
                                  const Text(
                                    "Synopsis",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const Divider(),
                                  Text(serie.description!),
                                ],
                              )
                            : const Text("No Synopsis"),

                        if (serieEpisodes == null || serieEpisodes.isEmpty)
                          const Center(
                            child: Text("This serie has no episodes"),
                          )
                        else
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "${(serie.episodes ?? []).length} episodes",
                                style: const TextStyle(
                                  fontWeight: .w700,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              for (final episode in serieEpisodes)
                                EpisodeRow(episode: episode),
                            ],
                          ),
                        const EndScrolledViewPadding(),
                      ],
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

class EpisodeRow extends StatelessWidget {
  final Episode episode;
  EpisodeRow({super.key, required this.episode}) : assert(episode.num != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(children: [Text("Episode ${episode.num}")]),
    );
  }
}

class SerieInformation extends StatelessWidget {
  final SeriePageParams params;
  final Serie serie;
  final AnimeSource source;
  const SerieInformation({
    super.key,
    required this.params,
    required this.serie,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        SerieImage(params: params, serie: serie),
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400, minWidth: 0),
            child: Padding(
              padding: const .symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: .max,
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  Row(
                    mainAxisSize: .min,
                    children: [
                      Expanded(
                        child: Text(
                          serie.name ?? "No Name",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: .w700,
                          ),
                          overflow: .ellipsis,
                          maxLines: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: .min,
                    spacing: 6,
                    children: [
                      Icon(
                        Icons.public_outlined,
                        color: ColorScheme.of(context).onSurfaceVariant,
                      ),
                      Text(
                        source.prettyName,
                        style: TextStyle(
                          color: ColorScheme.of(context).onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SerieImage extends ConsumerWidget {
  final SeriePageParams params;
  final Serie serie;
  const SerieImage({super.key, required this.params, required this.serie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeholderImage = ref.watch(
      imageProvider(params.placeholderImage ?? ""),
    );

    final serieImage = ref.watch(imageProvider(serie.image ?? ""));
    final serieImageWidget = serieImage.maybeWhen(
      orElse: () => const Center(child: Icon(Icons.broken_image)),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (image) => imgFromMemory(image),
    );

    return SizedBox(
      height: 280,
      width: 200,
      child: Card.filled(
        shape: RoundedRectangleBorder(borderRadius: .circular(imageRadius)),
        child: Transform.scale(
          scale: 1.01,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: child,
            ),
            child: placeholderImage.when(
              data: (image) => ClipRRect(
                borderRadius: .circular(imageRadius),
                child: serieImage.maybeWhen(
                  orElse: () => imgFromMemory(image),
                  data: (image) => imgFromMemory(image),
                ),
              ),

              error: (_, _) {
                return serieImageWidget;
              },

              loading: () => serieImage.maybeWhen(
                orElse: () => const Center(child: CircularProgressIndicator()),
                data: (image) => imgFromMemory(image),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get imageRadius => 10;
  Image imgFromMemory(Uint8List image) =>
      Image.memory(image, fit: .cover, width: .infinity, height: .infinity);
}
