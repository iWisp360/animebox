import 'package:animebox/core/servers/presentation/providers/source_provider.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/serie/views/serie_image.dart';
import 'package:animebox/ui/serie/views/serie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerieInformation extends ConsumerWidget {
  final SeriePageParams params;
  final Serie serie;
  final String? altImage;
  const SerieInformation({
    super.key,
    required this.params,
    required this.serie,
    this.altImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(animeSourceProvider(serie.sourceId));

    return Row(
      mainAxisSize: .min,
      children: [
        SerieImage(params: params, serie: serie, altImage: altImage),
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
                        source.whenOrNull(
                              data: (source) => source?.prettyName,
                            ) ??
                            "No Source",
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
