abstract class GraphqlClientRepository {
  Future<Map<String, dynamic>> query({
    Map<String, dynamic>? variables,
    required String query,
    required Uri serverUrl,
  });

  String createRequestBody(String query, Map<String, dynamic>? variables);
  GraphqlClientRepository();
}
