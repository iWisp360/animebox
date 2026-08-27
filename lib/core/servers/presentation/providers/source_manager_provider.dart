import 'dart:async';

import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/domain/exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceManagerProvider extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => ();

  Future<bool> enableSource(AnimeSource source, String serverUuid) =>
      _toggleSource(source, serverUuid, true);

  Future<bool> disableSource(AnimeSource source, String serverUuid) =>
      _toggleSource(source, serverUuid, false);

  Future<bool> _toggleSource(
    AnimeSource source,
    String serverUuid,
    bool state,
  ) async {
    bool toggled = false;

    Server? server = await ref
        .read(serverListProvider.notifier)
        .getServer(serverUuid);

    if (server == null) {
      throw MissingServerException(serverUuid);
    }

    server = server.copyWith(
      supportedAnimeSources: server.supportedAnimeSources.map((s) {
        if (s == source) {
          toggled = true;
          return s = s.copyWith(enabled: state, toggledManually: true);
        } else {
          return s;
        }
      }).toList(),
    );

    await ref.read(serverListProvider.notifier).modifyServer(server: server);

    return toggled;
  }
}
