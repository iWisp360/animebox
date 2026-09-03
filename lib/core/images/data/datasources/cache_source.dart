import 'dart:io';

import 'package:animebox/core/cache/data/repositories/cache.dart';
import 'package:animebox/core/images/data/datasources/image_source.dart';

class CacheImageSource extends ImageSource<File?, String> {
  const CacheImageSource(super.source);

  @override
  Future<File?> fetchImage() async {
    final cacheRepo = await CacheRepositoryImpl.defaultPath();
    return cacheRepo.fetchFile(filename: source);
  }
}
