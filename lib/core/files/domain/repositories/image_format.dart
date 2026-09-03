import 'dart:typed_data';

abstract class ImageFormatRepository {
  ImageFormat determineImageFormat(Uint8List image);
}

enum ImageFormat {
  jpg,
  png,
  gif,
  webp,
  unknown;

  String get extension => switch (this) {
    .jpg => ".jpg",
    .webp => ".webp",
    .unknown => "",
    .png => ".png",
    .gif => ".gif",
  };
}
