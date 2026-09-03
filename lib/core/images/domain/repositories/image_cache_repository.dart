import 'dart:typed_data';

import 'package:animebox/core/cache/domain/repositories/cache.dart';

abstract class ImageCacheRepository {
  ImageCacheRepository();
  CacheRepository? cacheRepository;

  Future<void> cacheImage(String filename, Uint8List data);
  Future<CacheRepository> initCacheRepository();
}
