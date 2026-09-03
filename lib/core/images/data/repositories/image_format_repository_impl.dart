import 'dart:typed_data';

import 'package:animebox/core/images/domain/entities/image_format.dart';
import 'package:animebox/core/images/domain/repositories/image_format_repository.dart';

/// https://en.wikipedia.org/wiki/List_of_file_signatures
class ImageFormatRepositoryImpl extends ImageFormatRepository {
  const ImageFormatRepositoryImpl();

  @override
  ImageFormat determineImageFormat(Uint8List image) {
    if (_isJpg(image)) {
      return .jpg;
    } else if (_isGif(image)) {
      return .gif;
    } else if (_isWebp(image)) {
      return .webp;
    } else if (_isPng(image)) {
      return .png;
    } else {
      return .unknown;
    }
  }

  @override
  String? fileExtension(ImageFormat format) {
    return switch (format) {
      .jpg => "jpg",
      .webp => "webp",
      .unknown => null,
      .png => "png",
      .gif => "gif",
    };
  }
}

// ff d8 ff e0 (Last byte can go from e0 to ef, so it's excluded here)
bool _isJpg(Uint8List image) =>
    image[0] == 0xff && image[1] == 0xd8 && image[2] == 0xff;

// 89 50 4e 47
bool _isPng(Uint8List image) =>
    image[0] == 0x89 &&
    image[1] == 0x50 &&
    image[2] == 0x4e &&
    image[3] == 0x47;

// 47 49 46 38
bool _isGif(Uint8List image) =>
    image[0] == 0x47 &&
    image[1] == 0x49 &&
    image[2] == 0x46 &&
    image[3] == 0x38;

// 52 49 46 46 ?? ?? ?? ?? 57 45 42 50
// ?? represents the file size
bool _isWebp(Uint8List image) =>
    image[0] == 0x52 &&
    image[1] == 0x49 &&
    image[2] == 0x46 &&
    image[3] == 0x46 &&
    image[8] == 0x57 &&
    image[9] == 0x45 &&
    image[10] == 0x42 &&
    image[11] == 0x50;
