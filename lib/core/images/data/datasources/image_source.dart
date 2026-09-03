import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:animebox/core/images/data/datasources/cache_source.dart';
import 'package:animebox/core/images/data/datasources/network_source.dart';

abstract class ImageSource<T, S> {
  const ImageSource(this.source);
  final S source;

  FutureOr<T> fetchImage();

  static ImageSource<Uint8List?, String> network(String source) =>
      NetworkImageSource(source);

  static ImageSource<File?, String> cache(String source) =>
      CacheImageSource(source);
}

class ImageSourceList {
  const ImageSourceList(this.sources);

  final List<ImageSource> sources;
  static ImageSourceList? nullable(List<ImageSource>? sources) =>
      (sources == null) ? null : .new(sources);

  @override
  bool operator ==(Object other) {
    if (other is! ImageSourceList) return false;
    if (sources.length == other.sources.length) {
      for (final (idx, s) in sources.indexed) {
        if (s.source != other.sources[idx].source) return false;
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => sources.map((s) => s.source).join("|").hashCode;
}
