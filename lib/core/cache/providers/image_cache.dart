import 'dart:io';
import 'dart:typed_data';

import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:animebox/core/files/data/repositories/image_format_impl.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_cache.g.dart';

@riverpod
Future<File?> imageCachePath(Ref ref, String? filename) async {
  if (filename == null) return null;

  final cacheDirectory = await cachePath();
  final cacheFile = File(join(cacheDirectory.path, filename));

  if (await cacheFile.exists()) {
    return cacheFile;
  } else {
    return null;
  }
}

/// Returns the filename with the extension included
@riverpod
Future<String> imageToCache(Ref ref, String filename, Uint8List image) async {
  final cacheDirectory = await cachePath();

  final imageFormat = ImageFormatRepositoryImpl().determineImageFormat(image);
  final imageFileName = "$filename${imageFormat.extension}";

  final cacheFile = File(join(cacheDirectory.path, imageFileName));

  if (await cacheFile.exists()) {
    await cacheFile.delete();
  }

  await cacheFile.create();
  await cacheFile.writeAsBytes(image);

  return imageFileName;
}
