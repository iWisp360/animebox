import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/data/datasources/server_urls.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/ui/routes.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/server_delete_dialog.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/source_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerDetailsPage extends ConsumerWidget {
  const ServerDetailsPage({super.key, required this.server});
  final Server server;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);
    final detailsTranslations = translations.settings.servers.details;
    return PopScope(
      canPop: !ref.watch(dialogOpenProvider),
      child: Scaffold(
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
                                        detailsTranslations.animeSources.details
                                            .identifier(sourceId: source.id),
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Expanded(child: SizedBox.shrink()),
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
        bottomNavigationBar: ColoredBox(
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Padding(
            padding: const .symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () async {
                    final response = await showDialog<bool>(
                      context: context,
                      builder: (context) => const ServerDeleteDialog(),
                    );

                    if (response == true && context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  },
                  icon: const Icon(Icons.delete),
                  label: Text(detailsTranslations.deleteServer.action),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
