import 'package:animebox/core/dates/domain/repositories/dates_repository.dart';
import 'package:animebox/features/episodes/data/repositories/episodes_format_repository_impl.dart';
import 'package:animebox/features/episodes/domain/repositories/episodes_format_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final episodesFormatProvider =
    Provider.family<EpisodesFormatRepository, (String?, DatesRepository)>((
      ref,
      params,
    ) {
      final (episodesName, datesRepository) = params;
      return EpisodesFormatRepositoryImpl(
        datesRepository: datesRepository,
        defaultEpisodeName: episodesName,
      );
    });
