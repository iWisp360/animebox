import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/series/data/repositories/episodes_sort_impl.dart';
import 'package:animebox/features/series/domain/repositories/episodes_sort.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _episodesSortRepositoryProvider = Provider((ref) {
  final config = ref.watch(configProvider);

  return EpisodesSortImpl(
    appearanceConfig: config.maybeWhen(
      orElse: () => const AppearanceConfig(),
      data: (config) => config.appearance,
    ),
  );
});

final episodesSortProvider = Provider.family<List<Episode>, List<Episode>>((
  ref,
  episodes,
) {
  final EpisodesSort repository = ref.watch(_episodesSortRepositoryProvider);

  return repository.sortEpisodes(episodes);
});
