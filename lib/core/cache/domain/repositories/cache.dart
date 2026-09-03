import 'dart:io';
import 'dart:typed_data';

abstract class CacheRepository {
  const CacheRepository(this.cachePath);

  final Directory cachePath;

  Future<void> cacheFile({required Uint8List data, required String filename});
  Future<File?> fetchFile({required String filename});
}
