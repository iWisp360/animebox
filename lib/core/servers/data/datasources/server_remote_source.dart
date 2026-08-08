import 'package:animebox/core/graphql/data/repositories/graphql_client_repository.dart';
import 'package:animebox/core/graphql/domain/repositories/graphql_client_repository.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';

abstract class ServerRemoteSource {
  Future<Server> getFromEndpoint(String url);
}

class ServerRemoteSourceImpl implements ServerRemoteSource {
  final GraphqlClientRepository clientRepository;

  ServerRemoteSourceImpl({GraphqlClientRepository? clientRepository})
    : clientRepository = clientRepository ?? GraphqlClientRepositoryImpl();

  @override
  Future<Server> getFromEndpoint(String url) async {
    clientRepository.url = url;
    final query = await clientRepository.query(serverInfoGraphqlQuery);

    final server = Server.fromJson(query);
    return server.copyWith(url: url);
  }

  static const serverInfoGraphqlQuery = """
    query {
      ServerInfo {
        name
        developer
        uuid
        version
        minCompat
        supportedAnimeSources {
          prettyName
          id
          noMetaProvider
          recommendations
          isHentaiSource
          lang
        }
        logoUrl
      }
    }
  """;
}
