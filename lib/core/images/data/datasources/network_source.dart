import 'dart:typed_data';

import 'package:animebox/core/images/data/datasources/image_source.dart';
import 'package:animebox/core/images/data/repositories/image_format_repository_impl.dart';
import 'package:animebox/core/images/domain/repositories/image_format_repository.dart';
import 'package:animebox/core/network/http_client.dart';

class NetworkImageSource extends ImageSource<Uint8List?, String?> {
  const NetworkImageSource(super.source);

  final ImageFormatRepository imageFormatRepository =
      const ImageFormatRepositoryImpl();

  @override
  Future<Uint8List?> fetchImage() async {
    if (source == null) return null;
    try {
      final response = await globalHttpClient.get(Uri.parse(source!));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        if (imageFormatRepository.determineImageFormat(bytes) == .unknown) {
          return null;
        } else {
          return bytes;
        }
      }
    } catch (e) {
      return null;
    }

    return null;
  }
}
