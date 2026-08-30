import 'package:animebox/ui/browse/views/global_search_page/global_search_page_view.dart';
import 'package:animebox/ui/browse/views/source_navigation_page/source_navigation_page.dart';
import 'package:animebox/ui/main_page/views/main_page_view.dart';
import 'package:animebox/ui/serie/views/serie_page.dart';
import 'package:animebox/ui/settings/views/about_page/about_page.dart';
import 'package:animebox/ui/settings/views/advanced_settings/advanced_settings_page.dart';
import 'package:animebox/ui/settings/views/appearance_settings/appearance_settings_page.dart';
import 'package:animebox/ui/settings/views/downloads_settings/downloads_settings_page.dart';
import 'package:animebox/ui/settings/views/library_settings/library_settings_page.dart';
import 'package:animebox/ui/settings/views/local_storage_settings/local_storage_settings_page.dart';
import 'package:animebox/ui/settings/views/metadata_settings/metadata_settings_page.dart';
import 'package:animebox/ui/settings/views/playback_settings/playback_settings_page.dart';
import 'package:animebox/ui/settings/views/server_settings/server_details/server_details_page.dart';
import 'package:animebox/ui/settings/views/server_settings/servers_settings_page.dart';
import 'package:animebox/ui/settings/views/settings_page.dart';
import 'package:animebox/core/global_info_feedback/global_info_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final mainRouterProvider = Provider(
  (ref) => GoRouter(
    initialLocation: "/",
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            GlobalInfoFeedback(builder: (context) => child),
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) => const MainPageView(),
            routes: [
              GoRoute(
                path: "serie",
                builder: (context, state) =>
                    SeriePage(params: state.extra as SeriePageParams),
              ),
              GoRoute(
                path: "globalSearch",
                builder: (context, state) => const GlobalSearchPageView(),
              ),
              GoRoute(
                path: "navigateSource",
                builder: (context, state) => SourceNavigationPage(
                  params: state.extra as SourceNavigationPageParams,
                ),
              ),
              GoRoute(
                path: "settings",
                builder: (context, state) => const SettingsPage(),
                routes: [
                  GoRoute(
                    path: "about",
                    builder: (context, state) => const AnimeBoxAboutPage(),
                  ),
                  GoRoute(
                    path: "advanced",
                    builder: (context, state) => const AdvancedSettingsPage(),
                  ),
                  GoRoute(
                    path: "appearance",
                    builder: (context, state) => const AppearanceSettingsPage(),
                  ),
                  GoRoute(
                    path: "downloads",
                    builder: (context, state) => const DownloadsSettingsPage(),
                  ),
                  GoRoute(
                    path: "library",
                    builder: (context, state) => const LibrarySettingsPage(),
                  ),
                  GoRoute(
                    path: "localStorage",
                    builder: (context, state) =>
                        const LocalStorageSettingsPage(),
                  ),
                  GoRoute(
                    path: "metadata",
                    builder: (context, state) => const MetadataSettingsPage(),
                  ),
                  GoRoute(
                    path: "playback",
                    builder: (context, state) => const PlaybackSettingsPage(),
                  ),
                  GoRoute(
                    path: "servers",
                    builder: (context, state) => const ServersSettingsPage(),
                    routes: [
                      GoRoute(
                        path: "details",
                        builder: (context, state) => ServerDetailsPage(
                          params: state.extra as ServerDetailsPageParams,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

final waitingRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
    ),
  ],
);

final dialogOpenProvider = NotifierProvider(() => DialogOpenProvider());

class DialogOpenProvider extends Notifier<bool> {
  int _openDialogsCounter = 0;

  @override
  bool build() => dialogOpened();

  void openDialog() {
    _openDialogsCounter++;
    state = dialogOpened();
  }

  void closeDialog() {
    _openDialogsCounter--;
    state = dialogOpened();
  }

  bool dialogOpened() => _openDialogsCounter > 0;
}

class DialogWithNotify extends ConsumerStatefulWidget {
  final Widget child;
  const DialogWithNotify({super.key, required this.child});

  @override
  ConsumerState<DialogWithNotify> createState() => _DialogWithNotifyState();
}

class _DialogWithNotifyState extends ConsumerState<DialogWithNotify> {
  late final DialogOpenProvider notifier;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier = ref.read(dialogOpenProvider.notifier);
      notifier.openDialog();
    });
  }

  @override
  void deactivate() {
    Future(() => notifier.closeDialog());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
