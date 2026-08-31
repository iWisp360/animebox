import 'package:animebox/features/anime_library/domain/entities/series_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'serie_store_provider.g.dart';

@Riverpod(keepAlive: true)
class StoredSeries extends _$StoredSeries {
  @override
  FutureOr<SeriesStore> build() async {
    throw UnimplementedError();
  }
}
