import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:animebox/core/injector.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_add_dialog.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/server_details_page.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class ServersSettingsPage extends ConsumerStatefulWidget {
  const ServersSettingsPage({super.key});

  @override
  ConsumerState<ServersSettingsPage> createState() =>
      _ServersSettingsPageState();
}

class _ServersSettingsPageState extends ConsumerState<ServersSettingsPage> {
  late final ConfigController _configController;

  @override
  void initState() {
    _configController = injector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serverList = ref.watch(serverListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Servers")),
      body: SettingsList(
        lightTheme: getSettingsThemeData(context),
        darkTheme: getSettingsThemeData(context),
        sections: [
          SettingsSection(
            title: const Text("Server list"),
            tiles: [
              ...serverList.when(
                error: (exception, st) => const [
                  CustomSettingsTile(
                    child: Center(child: CircularProgressIndicator()),
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
                                          ? "The server ${server.name ?? server.uuid} was deleted successfully"
                                          : "No server was deleted",
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
                    const CustomSettingsTile(
                      child: Padding(
                        padding: .symmetric(vertical: 30),
                        child: Center(child: Text("There are no servers.")),
                      ),
                    ),

                  CustomSettingsTile(
                    child: Padding(
                      padding: const .symmetric(vertical: 10),
                      child: Center(
                        child: FilledButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) => const ServerAddDialog(),
                            );
                          },
                          child: const Text("Add server"),
                        ),
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
                initialValue:
                    _configController.current.servers.disableAddedHentaiSources,
                onToggle: (value) => _configController.change(
                  _configController.current.copyWith(
                    servers: _configController.current.servers.copyWith(
                      disableAddedHentaiSources: value,
                    ),
                  ),
                ),
                title: const Text("Disable Hentai Sources"),
                description: const Text(
                  "Disables Hentai sources when adding servers. Doesn't modify the existing servers.",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
