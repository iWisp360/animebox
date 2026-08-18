class ExistingServerException implements Exception {
  String uuid;

  ExistingServerException(this.uuid);

  @override
  String toString() {
    return "The server with uuid '$uuid' already exists";
  }
}

class ServersNotInitializedException implements Exception {}
