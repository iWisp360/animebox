import 'package:animebox/core/dates/domain/repositories/dates_repository.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/episodes/domain/exceptions.dart';
import 'package:animebox/features/episodes/domain/repositories/episodes_format_repository.dart';

class EpisodesFormatRepositoryImpl implements EpisodesFormatRepository {
  @override
  String? defaultEpisodeName;

  @override
  DatesRepository datesRepository;

  EpisodesFormatRepositoryImpl({
    this.defaultEpisodeName,
    required this.datesRepository,
  });

  @override
  String renderFormat({required Episode episode, required String format}) {
    String renderedName = format;

    final parseRegex = RegExp("%([^%\\s]+)");
    final matches = parseRegex.allMatches(format);

    for (final match in matches) {
      final substitution = switch (match.group(1)) {
        "e" => episode.name ?? defaultEpisodeName ?? "Episode",
        "E" => defaultEpisodeName ?? "Episode",
        "n" => "${episode.num}",
        "d" => datesRepository.getRelativeDateFormat().format(.now()),
        "D" =>
          datesRepository
              .getAbsoluteDateFormat()
              .format(.now())
              .replaceAll("/", "."),
        _ => throw InvalidFormatException(),
      };

      renderedName = renderedName.replaceFirst(match.group(0)!, substitution);
    }

    if (!matches.any((match) => match.group(0) == "%n")) {
      throw NoNumberFormatException();
    }

    return renderedName;
  }
}
