import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/series/domain/repositories/episodes_sort.dart';

class EpisodesSortImpl extends EpisodesSort {
  @override
  List<Episode> sortEpisodes(List<Episode> episodes) {
    return [...(episodes)]..sort(
      appearanceConfig.reverseEpisodesOrder ? ascendSortFn : descendSortFn,
    );
  }

  EpisodesSortImpl({required super.appearanceConfig});
}
