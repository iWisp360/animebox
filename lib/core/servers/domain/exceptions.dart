class MissingServerException implements Exception {
  final String? serverUuid;
  String get message => (serverUuid != null)
      ? "The server with uuid $serverUuid is missing"
      : "The specified server is missing";

  @override
  String toString() {
    return "MissingServerException: $message";
  }

  MissingServerException([this.serverUuid]);
}
