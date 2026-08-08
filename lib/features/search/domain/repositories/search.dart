import 'package:animebox/features/search/domain/entities/search.dart';

abstract interface class SearchRepository {
  Future<Search> searchPattern(
    String pattern,
    String serverUuid,
    String sourceId,
  );
}
