import 'dart:typed_data';

import 'package:animebox/core/network/http_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_provider.g.dart';

@riverpod
Future<Uint8List> image(Ref ref, String url) async {
  final response = await globalHttpClient.get(Uri.parse(url));
  return response.bodyBytes;
}
