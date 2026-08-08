import 'package:animebox/features/search/domain/entities/search.dart';

abstract class SearchRepository {
  Future<Search> searchPattern({
    required String pattern,
    required String serverUuid,
    required String sourceId,
  });
}
