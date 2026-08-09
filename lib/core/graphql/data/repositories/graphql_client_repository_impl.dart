import 'dart:convert';

import 'package:animebox/core/graphql/domain/entities/request_body.dart';
import 'package:animebox/core/graphql/domain/entities/response.dart';
import 'package:animebox/core/graphql/domain/repositories/graphql_client_repository.dart';
import 'package:animebox/core/graphql/exceptions.dart';
import 'package:animebox/core/json.dart';
import 'package:animebox/core/network/http_client.dart';
import 'package:http/http.dart';

class GraphqlClientRepositoryImpl implements GraphqlClientRepository {
  final Client _client;

  GraphqlClientRepositoryImpl({Client? client})
    : _client = client ?? globalHttpClient;

  @override
  Future<Map<String, dynamic>> query({
    required String query,
    Map<String, dynamic>? variables,
    required String serverUrl,
  }) async {
    final requestBody = createRequestBody(query, variables);

    final response = (await _client.post(
      Uri.parse(serverUrl),
      body: requestBody,
    ));

    final jsonSerialized = utf8.decode(
      response.bodyBytes,
      allowMalformed: true,
    );

    final graphqlResponse = GraphqlResponse.fromJson(
      jsonDecoder().convert(jsonSerialized) as Map<String, dynamic>,
    );

    final responseData = graphqlResponse.data;

    if (responseData == null) {
      throw ServerException(errors: graphqlResponse.errors);
    }

    return unwrapRoot(responseData);
  }

  @override
  String createRequestBody(String query, Map<String, dynamic>? variables) {
    final body = GraphqlRequestBody(query: query, variables: variables);
    return jsonEncode(body.toJson());
  }

  /// Tries to get the only element on a map, if not possible, `object` is returned instead
  Map<String, dynamic> unwrapRoot(Map<String, dynamic> object) {
    if (object.values.length == 1) {
      final firstObject = object.values.first;
      if (firstObject is Map<String, dynamic>) {
        return firstObject;
      }
    }

    return object;
  }
}
