import 'package:animebox/features/browse/domain/entities/search.dart';

abstract class BrowseRepository {
  Future<Search> searchPattern({
    required String pattern,
    required String serverUuid,
    required String sourceId,
  });
}
