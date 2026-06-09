import 'package:animebox/core/config.dart';
import 'package:animebox/src/rust/api/data/caching/anime_sources.dart';
import 'package:flutter/material.dart';

late final AnimeSourcesController animeSourcesController;

class AnimeSourcesController {
  Stream<RefreshJob>? _activeStream;
  final AnimeSourcesCacheManager cacheManager;

  ValueNotifier<bool> isRefreshing = ValueNotifier(false);

  AnimeSourcesController({required this.cacheManager});

  static Future<void> init() async {
    animeSourcesController = AnimeSourcesController(
      cacheManager: await AnimeSourcesCacheManager.init(),
    );
  }

  Stream<RefreshJob>? getCurrentRefresh() => _activeStream;
  Stream<RefreshJob> doRefresh({
    final bool forceFetch = false,
    final bool noFetch = false,
    BuildContext? context,
    required final bool onlyMissing,
  }) {
    if (_activeStream != null) {
      return _activeStream!;
    } else {
      isRefreshing.value = true;
      _activeStream = animeSourcesController.cacheManager
          .refreshSources(
            forceFetch: forceFetch,
            noFetch: noFetch,
            onlyMissing: onlyMissing,
            servers: config.servers.servers,
          )
          .asBroadcastStream();

      _activeStream!.listen(
        (data) async {
          isRefreshing.value = false;
          cacheManager.sources = await cacheManager.getSources();
          if (context != null && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${data.success} sources refreshed and ${data.error} other sources threw errors",
                ),
                action: data.error > 0
                    ? SnackBarAction(
                        label: "See errors",
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHigh,
                          showDragHandle: true,
                          builder: (context) => SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (final error in data.errors.values)
                                  Text(error.toString()),
                              ],
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            );
          }
          cacheManager.update();
          _activeStream = null;
        },
        onError: (error) {
          isRefreshing.value = false;
          if (context != null && context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error)));
          }
          return _activeStream = null;
        },
        onDone: () {
          return _activeStream = null;
        },
        cancelOnError: true,
      );

      return _activeStream!;
    }
  }

  Future<void> update() async {
    await cacheManager.update();
  }

  void dispose() {
    if (_activeStream != null) {
      _activeStream = null;
    }
    cacheManager.dispose();
  }
}
