import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/search/domain/entities/search.dart';

abstract class SearchRepository {
  Future<Search> searchQuery({
    required String query,
    required Server server,
    required String sourceId,
  });
}
