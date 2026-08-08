import 'package:animebox/features/search/domain/entities/search.dart';
import 'package:animebox/features/search/domain/repositories/search.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Search> searchPattern(
    String pattern,
    String serverUuid,
    String sourceId,
  ) async {
    throw UnimplementedError();
  }
}
