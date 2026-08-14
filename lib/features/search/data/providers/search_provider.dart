import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/search/data/datasources/search.dart';
import 'package:animebox/features/search/domain/entities/search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchSourceProvider = Provider.autoDispose(
  (ref) => SearchSourceRemote(),
);

final searchRepositoryProvider =
    FutureProvider.family<
      Search,
      (String query, Server server, String sourceId)
    >((ref, params) async {
      final (query, server, sourceId) = params;

      final searchSource = ref.read(searchSourceProvider);

      return await searchSource.searchQuery(
        query: query,
        server: server,
        sourceId: sourceId,
      );
    });
