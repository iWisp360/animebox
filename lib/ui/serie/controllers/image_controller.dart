import 'dart:typed_data';

import 'package:animebox/core/network/image_provider.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageController {
  const ImageController();

  Future<Uint8List?> fetchSerieOrPlaceholder(
    WidgetRef ref,
    Serie serie, {
    String? placeholderImage,
  }) async {
    Uint8List? imageData;

    try {
      final serieImage = await ref.watch(
        imageProvider(serie.image ?? "").future,
      );

      imageData = serieImage;
    } catch (e) {
      try {
        final placeholder = await ref.watch(
          imageProvider(placeholderImage ?? "").future,
        );

        imageData = placeholder;
      } catch (e) {
        imageData = null;
      }
    }
    return imageData;
  }
}
