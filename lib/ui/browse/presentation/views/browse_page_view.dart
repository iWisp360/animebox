import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/core/widgets/page_information.dart';
import 'package:animebox/ui/browse/presentation/views/app_bar.dart';
import 'package:animebox/ui/browse/presentation/views/source_selector_builder.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/servers_settings_page.dart';
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
    final watchedServers = ref.watch(serverListProvider);

    return watchedServers.when(
      data: (servers) {
        return Scaffold(
          appBar: browsePageAppBar(context, activePage: servers.isNotEmpty),
          body: (servers.isEmpty)
              ? PageInformation(
                  spritesKind: .notFoundSprite,
                  message: "There are currently no servers.",
                  customAction: FilledButton.tonal(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ServersSettingsPage(),
                      ),
                    ),
                    child: const Text("Go to servers"),
                  ),
                )
              : SourceSelectorBuilder(servers: servers),
        );
      },

      error: (exception, st) => Scaffold(
        appBar: browsePageAppBar(context, activePage: false),
        body: PageInformation(
          spritesKind: .errorSprite,
          message: exception.toString(),
        ),
      ),
      loading: () => Scaffold(
        appBar: browsePageAppBar(context, activePage: false),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
