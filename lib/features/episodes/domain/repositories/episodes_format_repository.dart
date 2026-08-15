import 'package:animebox/core/dates/domain/repositories/dates_repository.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';

abstract class EpisodesFormatRepository {
  String? defaultEpisodeName;
  DatesRepository datesRepository;

  String renderFormat({required Episode episode, required String format});

  EpisodesFormatRepository({required this.datesRepository});
}
