import 'dart:typed_data';

import 'package:animebox/core/network/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider = FutureProvider.family<Uint8List, String>((
  ref,
  url,
) async {
  final response = await globalHttpClient.get(Uri.parse(url));
  return response.bodyBytes;
});
