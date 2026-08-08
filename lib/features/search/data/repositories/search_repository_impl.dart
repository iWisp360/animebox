import 'package:animebox/features/search/data/datasources/search.dart';
import 'package:animebox/features/search/domain/entities/search.dart';
import 'package:animebox/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Search> searchPattern({
    required String pattern,
    required String serverUuid,
    required String sourceId,
  }) async {
    return SearchSourceRemote().searchPattern(
      pattern: pattern,
      serverUuid: serverUuid,
      sourceId: sourceId,
    );
  }
}
