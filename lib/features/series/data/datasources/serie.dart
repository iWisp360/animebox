import 'package:animebox/core/graphql/data/repositories/graphql_client_repository_impl.dart';
import 'package:animebox/core/graphql/domain/repositories/graphql_client_repository.dart';
import 'package:animebox/core/schema/domain/entities/schema_v1/serie.dart';
import 'package:animebox/core/schema/exceptions.dart';
import 'package:animebox/core/servers/data/datasources/server_urls.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';

abstract class SerieSource {
  Future<Serie> getSerie({
    required String url,
    required Server server,
    required String sourceId,
  });

  String chooseSchemaQuery(int schemaVersion);
  Map<String, dynamic> createVariables(
    int schemaVersion,
    String query,
    String sourceId,
  );

  Serie parseSerieObject(
    Map<String, dynamic> json, {
    required int schemaVersion,
    required String serverUuid,
    required String sourceId,
  });
}

class SerieSourceRemote implements SerieSource {
  final GraphqlClientRepository clientRepository;

  SerieSourceRemote({GraphqlClientRepository? clientRepository})
    : clientRepository = clientRepository ?? GraphqlClientRepositoryImpl();

  @override
  Future<Serie> getSerie({
    required String url,
    required Server server,
    required String sourceId,
  }) async {
    final response = await clientRepository.query(
      serverUrl: Uri.parse(server.apiUrl()),
      query: chooseSchemaQuery(server.schemaVersion),
      variables: createVariables(server.schemaVersion, url, sourceId),
    );

    return parseSerieObject(
      response,
      schemaVersion: server.schemaVersion,
      serverUuid: server.uuid,
      sourceId: sourceId,
    );
  }

  @override
  String chooseSchemaQuery(int schemaVersion) => switch (schemaVersion) {
    1 => serieQueryV1,
    _ => throw UnsupportedSchemaVersionException(schemaVersion: schemaVersion),
  };

  @override
  Map<String, dynamic> createVariables(
    int schemaVersion,
    String serieUrl,
    String sourceId,
  ) => switch (schemaVersion) {
    1 => SerieVariablesV1(serieUrl: serieUrl, sourceId: sourceId).toJson(),
    _ => throw UnsupportedSchemaVersionException(schemaVersion: schemaVersion),
  };

  @override
  Serie parseSerieObject(
    Map<String, dynamic> json, {
    required int schemaVersion,
    required String serverUuid,
    required String sourceId,
  }) {
    switch (schemaVersion) {
      case 1:
        final deserializedSerie = SerieV1.fromJson(json);
        return Serie(
          serverUuid: serverUuid,
          sourceId: sourceId,
          name: deserializedSerie.name,
          image: deserializedSerie.image,
          description: deserializedSerie.description,
          episodes: deserializedSerie.episodes == null
              ? null
              : (deserializedSerie.episodes!)
                    .map(
                      (e) => Episode(
                        url: e.url,
                        num: e.num,
                        name: e.name,
                        sourceId: sourceId,
                        serverUuid: serverUuid,
                      ),
                    )
                    .toList(),
        );

      default:
        throw UnsupportedSchemaVersionException(schemaVersion: schemaVersion);
    }
  }
}
