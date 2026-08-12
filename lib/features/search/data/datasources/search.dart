import 'package:animebox/core/graphql/data/repositories/graphql_client_repository_impl.dart';
import 'package:animebox/core/graphql/domain/repositories/graphql_client_repository.dart';
import 'package:animebox/core/servers/data/repositories/server_repository_impl.dart';
import 'package:animebox/core/servers/domain/exceptions.dart';
import 'package:animebox/core/servers/domain/repositories/server_repository.dart';
import 'package:animebox/features/browse/domain/entities/search.dart';

abstract class SearchSource {
  Future<Search> searchPattern({
    required String pattern,
    required String serverUuid,
    required String sourceId,
  });
}

class SearchSourceRemote implements SearchSource {
  final ServerRepository serverRepository;
  final GraphqlClientRepository clientRepository;

  SearchSourceRemote({
    ServerRepository? serverRepository,
    GraphqlClientRepository? clientRepository,
  }) : serverRepository = serverRepository ?? ServerRepositoryImpl(),
       clientRepository = clientRepository ?? GraphqlClientRepositoryImpl();

  @override
  Future<Search> searchPattern({
    required String pattern,
    required String serverUuid,
    required String sourceId,
  }) async {
    final expectedServer = await serverRepository.getServer(serverUuid);

    if (expectedServer == null) throw MissingServerException(serverUuid);

    final query = await clientRepository.query(
      serverUrl: expectedServer.url,
      query: graphqlQuery,
      variables: {"pattern": pattern, "sourceId": sourceId},
    );

    return Search.fromJson(query);
  }

  static const graphqlQuery = """
    query Search(\$pattern: String!, \$sourceId: ID!) { 
      Search(pattern: \$pattern, sourceId: \$sourceId) { 
        data { 
          url 
          name 
          image
        } 
        fetchDate 
      }
    }
  """;
}
