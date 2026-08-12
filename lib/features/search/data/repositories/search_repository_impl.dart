import 'package:animebox/features/browse/data/datasources/search.dart';
import 'package:animebox/features/browse/domain/entities/search.dart';
import 'package:animebox/features/browse/domain/repositories/search_repository.dart';

class BrowseRepositoryImpl implements BrowseRepository {
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
