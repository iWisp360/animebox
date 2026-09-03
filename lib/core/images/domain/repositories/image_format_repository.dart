import 'dart:typed_data';

import 'package:animebox/core/images/domain/entities/image_format.dart';

abstract class ImageFormatRepository {
  const ImageFormatRepository();

  ImageFormat determineImageFormat(Uint8List image);
  String? fileExtension(ImageFormat format);
}
