import 'package:animebox/core/images/data/datasources/image_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_source_resolver.g.dart';

@Riverpod(name: "imageSourceResolver", keepAlive: true)
Future<T?> resolveImageSource<T, S>(Ref ref, ImageSourceList sources) async {
  for (final source in sources.sources) {
    try {
      final image = await source.fetchImage();
      if (image == null) continue;
      return image;
    } catch (e) {
      continue;
    }
  }

  return null;
}
