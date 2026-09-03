import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/serie/views/serie_actions.dart';
import 'package:animebox/ui/serie/views/serie_information.dart';
import 'package:animebox/ui/serie/views/serie_page.dart';
import 'package:animebox/ui/utils/end_scrolled_view_padding.dart';
import 'package:flutter/material.dart';

class SerieView extends StatelessWidget {
  final Serie serie;
  final SeriePageParams params;
  final String? altImage;
  final List<Episode>? episodes;

  const SerieView({
    super.key,
    required this.serie,
    required this.params,
    this.altImage,
    this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: .start,
      mainAxisAlignment: .start,
      children: [
        SerieInformation(params: params, serie: serie, altImage: altImage),
        SerieActions(serie: serie, params: params),

        (serie.description != null)
            ? _SerieDescription(description: serie.description!)
            : const Text("No Synopsis"),

        if (episodes == null || episodes!.isEmpty)
          const Center(child: Text("This serie has no episodes"))
        else
          _EpisodeList(episodes: episodes),
        const EndScrolledViewPadding(),
      ],
    );
  }
}

class _SerieDescription extends StatelessWidget {
  final String description;
  const _SerieDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const Text("Synopsis", style: TextStyle(fontSize: 16)),
        const Divider(),
        Text(description),
      ],
    );
  }
}

class _EpisodeList extends StatelessWidget {
  final List<Episode>? episodes;
  const _EpisodeList({this.episodes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "${(episodes ?? []).length} episodes",
          style: const TextStyle(fontWeight: .w700, fontSize: 16),
        ),
        const SizedBox(height: 10),
        for (final episode in episodes!) _EpisodeRow(episode: episode),
      ],
    );
  }
}

class _EpisodeRow extends StatelessWidget {
  final Episode episode;
  const _EpisodeRow({required this.episode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text("Episode ${episode.num ?? episode.name ?? episode.url}"),
        ],
      ),
    );
  }
}
