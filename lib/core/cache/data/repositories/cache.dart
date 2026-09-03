import 'dart:io';
import 'dart:typed_data';

import 'package:animebox/core/cache/domain/repositories/cache.dart';
import 'package:animebox/core/files/data/datasources/internal_data_directory.dart'
    as internal;
import 'package:path/path.dart';

class CacheRepositoryImpl extends CacheRepository {
  const CacheRepositoryImpl(super.cachePath);

  @override
  Future<void> cacheFile({
    required Uint8List data,
    required String filename,
  }) async {
    final filePath = join(cachePath.path, filename);
    final cacheFile = File(filePath);

    await cacheFile.writeAsBytes(data);
  }

  @override
  Future<File?> fetchFile({required String filename}) async {
    final filePath = join(cachePath.path, filename);
    final cacheFile = File(filePath);

    if (await cacheFile.exists()) {
      return cacheFile;
    } else {
      return null;
    }
  }

  static Future<CacheRepositoryImpl> defaultPath() async =>
      CacheRepositoryImpl(await internal.cachePath());
}
