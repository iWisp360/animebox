import 'package:animebox/core/l10n/context.dart';
import 'package:animebox/features/settings/presentation/views/server_settings/servers_settings_page.dart';
import 'package:animebox/features/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsPageHeader)),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                title: const Text("Servers"),
                value: const Text("Manage your servers to get anime"),
                onPressed: (context) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ServersSettingsPage(),
                  ),
                ),
                leading: const Icon(Icons.cloud),
              ),
            ],
          ),
        ],
        lightTheme: getSettingsThemeData(context),
        darkTheme: getSettingsThemeData(context),
      ),
    );
  }
}
