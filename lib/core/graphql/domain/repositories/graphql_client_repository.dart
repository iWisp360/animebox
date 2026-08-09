abstract class GraphqlClientRepository {
  Future<Map<String, dynamic>> query({
    Map<String, dynamic>? variables,
    required String query,
    required String serverUrl,
  });

  String createRequestBody(String query, Map<String, dynamic>? variables);
  GraphqlClientRepository();
}
