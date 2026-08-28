import 'package:animebox/core/graphql/data/repositories/graphql_client_repository_impl.dart';
import 'package:animebox/core/graphql/domain/repositories/graphql_client_repository.dart';
import 'package:animebox/core/schema/domain/entities/schema_v1/search.dart';
import 'package:animebox/core/schema/exceptions.dart';
import 'package:animebox/core/servers/data/datasources/server_urls.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/search/domain/entities/search.dart';

abstract class SearchSource {
  Future<Search> searchQuery({
    required String query,
    required Server server,
    required String sourceId,
  });

  String chooseSchemaQuery(int schemaVersion);
  Map<String, dynamic> createVariables(
    int schemaVersion,
    String query,
    String sourceId,
  );
  Search parseSearchObject(Map<String, dynamic> json, int schemaVersion);
}

class SearchSourceRemote implements SearchSource {
  final GraphqlClientRepository clientRepository;

  SearchSourceRemote({GraphqlClientRepository? clientRepository})
    : clientRepository = clientRepository ?? GraphqlClientRepositoryImpl();

  @override
  Future<Search> searchQuery({
    required String query,
    required Server server,
    required String sourceId,
  }) async {
    final response = await clientRepository.query(
      serverUrl: Uri.parse(server.apiUrl()),
      query: chooseSchemaQuery(server.schemaVersion),
      variables: createVariables(server.schemaVersion, query, sourceId),
    );

    return parseSearchObject(response, server.schemaVersion);
  }

  @override
  String chooseSchemaQuery(int schemaVersion) => switch (schemaVersion) {
    1 => searchQueryV1,
    _ => throw UnsupportedSchemaVersionException(schemaVersion: schemaVersion),
  };

  @override
  Map<String, dynamic> createVariables(
    int schemaVersion,
    String query,
    String sourceId,
  ) => switch (schemaVersion) {
    1 => SearchVariablesV1(pattern: query, sourceId: sourceId).toJson(),
    _ => throw UnsupportedSchemaVersionException(schemaVersion: schemaVersion),
  };

  @override
  Search parseSearchObject(Map<String, dynamic> json, int schemaVersion) {
    switch (schemaVersion) {
      case 1:
        final deserializedSearch = SearchV1.fromJson(json);
        final results = deserializedSearch.results
            .map(
              (result) => SearchResults(
                name: result.name,
                image: result.image,
                url: result.url,
              ),
            )
            .toList();

        return Search(
          results: results,
          fetchDate: deserializedSearch.fetchDate,
        );
      default:
        throw UnsupportedSchemaVersionException(schemaVersion: schemaVersion);
    }
  }
}
