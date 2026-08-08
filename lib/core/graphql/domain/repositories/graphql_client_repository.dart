abstract class GraphqlClientRepository {
  String? url;

  Future<Map<String, dynamic>> query(
    String query, {
    Map<String, dynamic>? variables,
  });

  String createRequestBody(String query, Map<String, dynamic>? variables);
  GraphqlClientRepository({this.url});
}
