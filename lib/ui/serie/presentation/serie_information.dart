import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/serie/presentation/serie_image.dart';
import 'package:animebox/ui/serie/presentation/serie_page.dart';
import 'package:flutter/material.dart';

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
