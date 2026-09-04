class MissingServerException implements Exception {
  const MissingServerException([this.serverUuid]);

  final String? serverUuid;
  String get message => (serverUuid != null)
      ? "The server with uuid $serverUuid is missing"
      : "The specified server is missing";

  @override
  String toString() {
    return "MissingServerException: $message";
  }
}

class MissingSourceException implements Exception {
  const MissingSourceException([this.sourceId]);

  final String? sourceId;
  String get message => (sourceId != null)
      ? "The anime source with id $sourceId is missing"
      : "The specified anime source is missing";
}
