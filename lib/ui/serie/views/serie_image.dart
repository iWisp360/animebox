import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/serie/views/serie_page.dart';
import 'package:animebox/ui/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerieImage extends ConsumerWidget {
  final SeriePageParams params;
  final Serie serie;
  final String? altImage;
  const SerieImage({
    super.key,
    required this.params,
    required this.serie,
    this.altImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: isDesktopWidth(context) ? 200 : 120,
      child: AspectRatio(
        aspectRatio: 9 / 13,
        child: Card.filled(
          shape: RoundedRectangleBorder(borderRadius: .circular(imageRadius)),
          child: ClipRRect(
            borderRadius: .circular(8),
            child: ImageBuilder(
              sources: .new([
                if (serie.cacheImage != null) .cache(serie.cacheImage!),
                if (serie.image != null) .network(serie.image!),
                if (altImage != null) .network(altImage!),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  double get imageRadius => 10;
}
