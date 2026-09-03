import 'dart:typed_data';

import 'package:animebox/core/cache/providers/image_cache.dart';
import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/network/image_provider.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:animebox/ui/serie/views/serie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerieImage extends ConsumerWidget {
  final SeriePageParams params;
  final Serie serie;
  const SerieImage({super.key, required this.params, required this.serie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cachedImage = ref
        .watch(imageCachePathProvider(serie.cacheImage))
        .whenOrNull(data: (image) => image);

    return SizedBox(
      width: isDesktopWidth(context) ? 200 : 120,
      child: AspectRatio(
        aspectRatio: 9 / 13,
        child: Card.filled(
          shape: RoundedRectangleBorder(borderRadius: .circular(imageRadius)),
          child: Transform.scale(
            scale: 1.01,
            child: ClipRRect(
              borderRadius: .circular(imageRadius),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: (cachedImage != null)
                    ? Image.file(
                        cachedImage,
                        fit: .cover,
                        width: .infinity,
                        height: .infinity,
                      )
                    : fetchSerieImage(ref),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget fetchSerieImage(WidgetRef ref) {
    final placeholderImage = ref.watch(
      imageProvider(params.placeholderImage ?? ""),
    );

    final serieImage = ref.watch(imageProvider(serie.image ?? ""));

    final serieImageWidget = serieImage.maybeWhen(
      orElse: () => const Center(child: Icon(Icons.broken_image)),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (sImage) => imgFromMemory(sImage),
    );

    return placeholderImage.when(
      data: (pImage) => serieImage.maybeWhen(
        orElse: () => imgFromMemory(pImage),
        data: (sImage) => imgFromMemory(sImage),
      ),

      error: (_, _) {
        return serieImageWidget;
      },

      loading: () => serieImage.maybeWhen(
        orElse: () => const Center(child: CircularProgressIndicator()),
        data: (sImage) => imgFromMemory(sImage),
      ),
    );
  }

  double get imageRadius => 10;
  Image imgFromMemory(Uint8List image) =>
      Image.memory(image, fit: .cover, width: .infinity, height: .infinity);
}
