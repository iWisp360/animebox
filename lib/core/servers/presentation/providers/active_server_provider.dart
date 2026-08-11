import 'dart:async';

import 'package:animebox/core/injector.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActiveServerProvider extends AsyncNotifier<Server?> {
  String? _activeServer;
  final SharedPreferences sharedPreferences = injector();

  @override
  FutureOr<Server?> build() async {
    final serverList = await ref.watch(serverListProvider.future);
    try {
      _activeServer ??= sharedPreferences.getString("activeServer");
    } catch (e) {
      return null;
    }

    return serverList.firstWhereOrNull(
      (server) => server.uuid == _activeServer,
    );
  }

  Future<void> setActiveServer(String uuid) async {
    final serverList = ref.read(serverListProvider.notifier);
    state = AsyncValue.data(await serverList.getServer(uuid));
    await sharedPreferences.setString("activeServer", uuid);
    _activeServer = uuid;
  }
}
