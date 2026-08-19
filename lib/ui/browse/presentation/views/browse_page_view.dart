import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/navigate_to_server_settings.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/reset_servers_button.dart';
import 'package:animebox/ui/widgets/page_information.dart';
import 'package:animebox/ui/browse/presentation/views/app_bar.dart';
import 'package:animebox/ui/browse/presentation/views/source_selector_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrowsePageView extends ConsumerStatefulWidget {
  const BrowsePageView({super.key});

  @override
  ConsumerState<BrowsePageView> createState() => _BrowsePageViewState();
}

class _BrowsePageViewState extends ConsumerState<BrowsePageView> {
  @override
  Widget build(BuildContext context) {
    final translations = ref.watch(i18nProvider);
    final browsePageTranslations = translations.browsePage;
    final watchedServers = ref.watch(serverListProvider);

    return watchedServers.when(
      data: (servers) {
        return Scaffold(
          appBar: browsePageAppBar(context, activePage: servers.isNotEmpty),
          body: (servers.isEmpty)
              ? PageInformation(
                  spritesKind: .notFoundSprite,
                  message: browsePageTranslations.noServersState.message,
                  customAction: FilledButton.tonal(
                    onPressed: () => navigateToServerSettings(context),
                    child: Text(
                      browsePageTranslations.noServersState.actionGoToServers,
                    ),
                  ),
                )
              : SourceSelectorBuilder(servers: servers),
        );
      },

      error: (_, _) => Scaffold(
        appBar: browsePageAppBar(context, activePage: false),
        body: const PageInformation(
          spritesKind: .errorSprite,
          message: "The servers failed to load",
          customAction: ResetServersButton(),
        ),
      ),
      loading: () => Scaffold(
        appBar: browsePageAppBar(context, activePage: false),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
