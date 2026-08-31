import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/core/configs/domain/providers/config_provider.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/series/data/repositories/episodes_sort_impl.dart';
import 'package:animebox/features/series/domain/repositories/episodes_sort.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'episodes_sort.g.dart';

@riverpod
EpisodesSort _episodesSortRepository(Ref ref) {
  final config = ref.watch(configProvider);

  return EpisodesSortImpl(
    appearanceConfig: config.maybeWhen(
      orElse: () => const AppearanceConfig(),
      data: (config) => config.appearance,
    ),
  );
}

@riverpod
List<Episode> episodesSort(Ref ref, List<Episode> episodes) {
  final EpisodesSort repository = ref.watch(_episodesSortRepositoryProvider);

  return repository.sortEpisodes(episodes);
}
