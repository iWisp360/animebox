class UnsupportedSchemaVersionException implements Exception {
  int schemaVersion;

  UnsupportedSchemaVersionException({required this.schemaVersion});

  @override
  String toString() {
    return "The schema version v$schemaVersion is not supported by the current version of Anime Box.";
  }
}
