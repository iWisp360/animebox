import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/ui/settings/presentation/views/page_builder.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/reset_servers_button.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_add_dialog.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/server_details_page.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class ServersSettingsPage extends ConsumerWidget {
  const ServersSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettingsTranslations = context.i18n.settings.servers;
    final serverList = ref.watch(serverListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(serverSettingsTranslations.title)),
      body: SettingsPageBuilder(
        builder: (context, config) => SettingsList(
          lightTheme: getSettingsThemeData(context),
          darkTheme: getSettingsThemeData(context),
          sections: [
            SettingsSection(
              title: Text(serverSettingsTranslations.listSection.title),
              tiles: [
                ...serverList.when(
                  error: (exception, st) => const [
                    CustomSettingsTile(
                      child: Center(
                        child: Column(
                          spacing: 10,
                          children: [
                            Text("The servers failed to load"),
                            ResetServersButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                  loading: () => [
                    const CustomSettingsTile(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ],
                  data: (serverList) => [
                    if (serverList.isNotEmpty)
                      for (final server in serverList)
                        SettingsTile.navigation(
                          leading: (server.logoUrl != null)
                              ? Image.network(server.logoUrl!)
                              : null,

                          onPressed: (context) async {
                            final deleteOrder = await Navigator.of(context)
                                .push<bool>(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ServerDetailsPage(server: server),
                                  ),
                                );

                            if (deleteOrder == true && context.mounted) {
                              try {
                                final deleted = await ref
                                    .read(serverListProvider.notifier)
                                    .removeServer(uuid: server.uuid);

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        deleted
                                            ? serverSettingsTranslations.state
                                                  .successDeletedServer(
                                                    serverName:
                                                        server.name ??
                                                        server.uuid,
                                                  )
                                            : serverSettingsTranslations
                                                  .state
                                                  .noDeletedServer,
                                      ),
                                    ),
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(SnackBar(content: Text("$e")));
                                }
                              }
                            }
                          },
                          title: Text(server.name ?? server.uuid),
                          value: Text(server.url.toString()),
                        )
                    else
                      CustomSettingsTile(
                        child: Padding(
                          padding: const .symmetric(vertical: 30),
                          child: Center(
                            child: Text(
                              serverSettingsTranslations
                                  .listSection
                                  .noServersState,
                            ),
                          ),
                        ),
                      ),

                    CustomSettingsTile(
                      child: Padding(
                        padding: const .symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: .center,
                          spacing: 16,
                          children: [
                            FilledButton(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) => const ServerAddDialog(),
                                );
                              },
                              child: Text(
                                serverSettingsTranslations
                                    .addServerDialog
                                    .action,
                              ),
                            ),
                            if (serverList.isNotEmpty)
                              FilledButton.tonal(
                                onPressed: () async => await ref
                                    .read(serverListProvider.notifier)
                                    .updateServers(),
                                child: const Text("Update Servers"),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SettingsSection(
              tiles: [
                SettingsTile.switchTile(
                  initialValue: config.servers.disableAddedHentaiSources,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith(
                          servers: config.servers.copyWith(
                            disableAddedHentaiSources: value,
                          ),
                        ),
                      ),
                  title: Text(
                    serverSettingsTranslations
                        .customizationSection
                        .disableAddedHentaiSources
                        .title,
                  ),
                  description: Text(
                    serverSettingsTranslations
                        .customizationSection
                        .disableAddedHentaiSources
                        .description,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
