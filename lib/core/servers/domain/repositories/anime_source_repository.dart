import 'package:animebox/core/servers/domain/entities/anime_sources.dart';

abstract class AnimeSourceRepository {
  /// Gets a specified source from a server.
  ///
  /// Returns `null` when the server is missing or the source is not present for this server
  AnimeSource? getSource(String serverUuid, String sourceId);

  /// Gets all the sources from a server.
  ///
  /// Returns `null` when the server is missing.
  List<AnimeSource>? getSourcesFromServer(String serverUuid);

  /// Gets all the sources from all the servers(The sources lists from the servers are flattened).
  List<AnimeSource> getAllSources();
}
