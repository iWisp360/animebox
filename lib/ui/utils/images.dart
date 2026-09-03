import 'dart:io';
import 'dart:typed_data';

import 'package:animebox/core/images/data/datasources/image_source.dart';
import 'package:animebox/core/images/data/providers/image_source_resolver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// builds an image from a list of sources.
class ImageBuilder extends ConsumerWidget {
  final ImageSourceList? sources;
  const ImageBuilder({super.key, this.sources});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (sources == null) return _fallback;

    final result = ref.watch(imageSourceResolver(sources!));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: result.maybeWhen(
        data: (image) {
          if (image is Uint8List) {
            return _memory(image);
          } else if (image is File) {
            return _file(image);
          } else {
            return _fallback;
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        orElse: () => _fallback,
      ),
    );
  }

  Widget get _fallback => const Center(child: Icon(Icons.cloud_off));
  Widget _memory(Uint8List bytes) =>
      Image.memory(bytes, fit: .cover, width: .infinity, height: .infinity);

  Widget _file(File file) =>
      Image.file(file, fit: .cover, width: .infinity, height: .infinity);
}
