import 'dart:typed_data';

import 'package:animebox/core/cache/data/repositories/cache.dart';
import 'package:animebox/core/cache/domain/repositories/cache.dart';
import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:animebox/core/images/data/repositories/image_format_repository_impl.dart';
import 'package:animebox/core/images/domain/repositories/image_cache_repository.dart';
import 'package:animebox/core/images/domain/repositories/image_format_repository.dart';

class ImageCacheRepositoryImpl extends ImageCacheRepository {
  ImageFormatRepository formatRepository = const ImageFormatRepositoryImpl();

  @override
  Future<void> cacheImage(String filename, Uint8List data) async {
    final cacheRepository = await initCacheRepository();

    final imgFormat = formatRepository.determineImageFormat(data);
    final fileExtension = formatRepository.fileExtension(imgFormat);

    final fullFilename = (fileExtension == null)
        ? filename
        : "$filename.$fileExtension";

    await cacheRepository.cacheFile(data: data, filename: fullFilename);
  }

  @override
  Future<CacheRepository> initCacheRepository() async =>
      cacheRepository ??= CacheRepositoryImpl(await cachePath());
}
