import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/ui/browse/views/app_bar.dart';
import 'package:animebox/ui/browse/views/source_selector_builder.dart';
import 'package:animebox/ui/settings/views/server_settings/reset_servers_button.dart';
import 'package:animebox/ui/utils/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BrowsePageView extends ConsumerWidget {
  const BrowsePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    onPressed: () => context.push("/settings/servers"),
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
