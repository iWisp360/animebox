import 'dart:convert';

import 'package:animebox/core/graphql/domain/entities/request_body.dart';
import 'package:animebox/core/graphql/domain/repositories/graphql_client_repository.dart';
import 'package:http/http.dart';

Client _client = Client();

class GraphqlClientRepositoryImpl implements GraphqlClientRepository {
  @override
  final String url;

  GraphqlClientRepositoryImpl({required this.url});

  @override
  Future<Map<String, dynamic>> query(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final requestBody = createRequestBody(query, variables);

    final response = (await _client.post(Uri.parse(url), body: requestBody));
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  @override
  String createRequestBody(String query, Map<String, dynamic>? variables) {
    final body = GraphqlRequestBody(query: query, variables: variables);
    return jsonEncode(body.toJson());
  }
}
