import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';

abstract class EpisodesSort {
  final AppearanceConfig appearanceConfig;

  List<Episode> sortEpisodes(List<Episode> episodes);

  int descendSortFn(dynamic a, dynamic b) =>
      _sortFn(a as Episode, b as Episode);

  int ascendSortFn(dynamic a, dynamic b) {
    (a, b) = (b, a);

    return _sortFn(a as Episode, b as Episode);
  }

  int _sortFn(Episode a, Episode b) => switch (_sortBy(a, b)) {
    .num => a.num!.compareTo(b.num!),
    .name => a.name!.compareTo(b.name!),
    .url => a.url!.compareTo(b.url!),
    .none => -1,
  };

  _SortBy _sortBy(Episode a, Episode b) {
    if (b.num != null && a.num != null) {
      return .num;
    } else if (b.name != null && a.name != null) {
      return .name;
    } else if (b.url != null && a.url != null) {
      return .url;
    } else {
      return .none;
    }
  }

  const EpisodesSort({required this.appearanceConfig});
}

enum _SortBy { num, name, url, none }
