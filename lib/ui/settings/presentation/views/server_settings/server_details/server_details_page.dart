import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/data/datasources/server_urls.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/ui/routes.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/server_delete_dialog.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/source_details_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerDetailsPageParams {
  final String serverUuid;
  final bool canDelete;

  const ServerDetailsPageParams({
    required this.serverUuid,
    required this.canDelete,
  });
}

class ServerDetailsPage extends ConsumerStatefulWidget {
  final ServerDetailsPageParams params;
  const ServerDetailsPage({super.key, required this.params});

  @override
  ConsumerState<ServerDetailsPage> createState() => _ServerDetailsPageState();
}

class _ServerDetailsPageState extends ConsumerState<ServerDetailsPage> {
  Server? _cachedServer;

  @override
  void dispose() {
    _cachedServer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serverList = ref.watch(serverListProvider);

    final translations = ref.watch(i18nProvider);
    final detailsTranslations = translations.settings.servers.details;
    return PopScope(
      canPop: !ref.watch(dialogOpenProvider),
      child: serverList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (list) {
          final choosedServer = list.firstWhereOrNull(
            (s) => s.uuid == widget.params.serverUuid,
          );

          if (_cachedServer != choosedServer && choosedServer != null) {
            _cachedServer = choosedServer;
          }

          if (_cachedServer == null) {
            return const Center(
              child: Text(
                "Somehow, This server is missing from the list",
                textAlign: .center,
              ),
            );
          }

          final server = _cachedServer!;

          return Scaffold(
            appBar: AppBar(title: Text(detailsTranslations.title)),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: (server.logoUrl != null)
                          ? Image.network(server.logoUrl!)
                          : null,
                    ),
                    const SizedBox(height: 40, width: 40),
                    SelectableText(
                      server.name ?? server.uuid,
                      style: const TextStyle(fontSize: 30, fontWeight: .w700),
                      textAlign: .center,
                    ),

                    if (server.name != null)
                      SelectableText(
                        server.uuid,
                        style: const TextStyle(fontSize: 14, fontWeight: .w400),
                        textAlign: .center,
                      ),

                    const SizedBox(height: 2),
                    SelectableText(
                      detailsTranslations.apiUrl(url: server.apiUrl()),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SelectableText(
                      detailsTranslations.infoUrl(url: server.infoUrl()),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SelectableText(
                      detailsTranslations.version(
                        schemaVersion: server.schemaVersion,
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 40, width: 40),
                    Padding(
                      padding: calculateDefaultPadding(context),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Padding(
                            padding: const .symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(detailsTranslations.animeSources.title),
                                Text(
                                  detailsTranslations.animeSources.information(
                                    n: server.supportedAnimeSources.length,
                                  ),
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                const Divider(),
                              ],
                            ),
                          ),
                          for (final source in server.supportedAnimeSources)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (context) =>
                                      SourceDetailsDialog(source: source),
                                ),
                                child: Padding(
                                  padding: const .symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: .start,
                                        children: [
                                          Text(source.prettyName),
                                          Text(
                                            detailsTranslations
                                                .animeSources
                                                .details
                                                .identifier(
                                                  sourceId: source.id,
                                                ),
                                            style: TextStyle(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox.shrink()),
                                      Checkbox(
                                        value: source.enabled,
                                        onChanged: (state) async {
                                          if (state == true) {
                                            await ref
                                                .read(
                                                  sourceManagerProvider
                                                      .notifier,
                                                )
                                                .enableSource(
                                                  source,
                                                  server.uuid,
                                                );
                                          } else if (state == false) {
                                            await ref
                                                .read(
                                                  sourceManagerProvider
                                                      .notifier,
                                                )
                                                .disableSource(
                                                  source,
                                                  server.uuid,
                                                );
                                          }
                                        },
                                      ),
                                      const Icon(Icons.chevron_right),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: (widget.params.canDelete)
                ? ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const .symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          FilledButton.tonalIcon(
                            onPressed: () async {
                              final response = await showDialog<bool>(
                                context: context,
                                builder: (context) =>
                                    const ServerDeleteDialog(),
                              );

                              if (response == true && context.mounted) {
                                Navigator.of(context).pop(true);
                              }
                            },
                            icon: const Icon(Icons.delete),
                            label: Text(
                              detailsTranslations.deleteServer.action,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
          );
        },
        error: (e, st) => Center(child: Text(e.toString())),
      ),
    );
  }
}
