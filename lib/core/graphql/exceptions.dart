class UnspecifiedUrlException implements Exception {
  @override
  String toString() {
    return "UnspecifiedUrlException: This graphql client's url is not specified";
  }
}

class ServerException implements Exception {
  final List<dynamic>? errors;

  @override
  String toString() {
    return errors != null
        ? "ServerException: The server returned an error: $errors"
        : "ServerException: The server returned an error";
  }

  ServerException({required this.errors});
}
