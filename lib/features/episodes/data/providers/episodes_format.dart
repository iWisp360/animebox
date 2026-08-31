import 'package:animebox/core/dates/domain/repositories/dates_repository.dart';
import 'package:animebox/features/episodes/data/repositories/episodes_format_repository_impl.dart';
import 'package:animebox/features/episodes/domain/repositories/episodes_format_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'episodes_format.g.dart';

@riverpod
EpisodesFormatRepository episodesFormat(
  Ref ref, {
  required String? episodesName,
  required DatesRepository datesRepository,
}) {
  return EpisodesFormatRepositoryImpl(
    datesRepository: datesRepository,
    defaultEpisodeName: episodesName,
  );
}
