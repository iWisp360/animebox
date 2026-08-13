import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/search/data/datasources/search.dart';
import 'package:animebox/features/search/domain/entities/search.dart';
import 'package:animebox/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Search> searchQuery({
    required String query,
    required Server server,
    required String sourceId,
  }) async {
    return SearchSourceRemote().searchQuery(
      query: query,
      server: server,
      sourceId: sourceId,
    );
  }
}
