import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/ui/settings/presentation/views/appearance_settings/appearance_settings_page.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/servers_settings_page.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsTranslations = context.i18n.settings;

    return Scaffold(
      appBar: AppBar(title: Text(settingsTranslations.pageHeader)),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                title: Text(settingsTranslations.appearance.title),
                value: Text(settingsTranslations.appearance.description),
                leading: const Icon(Icons.palette),
                onPressed: (context) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppearanceSettingsPage(),
                  ),
                ),
              ),
              SettingsTile.navigation(
                title: Text(settingsTranslations.servers.title),
                value: Text(settingsTranslations.servers.description),
                leading: const Icon(Icons.cloud),
                onPressed: (context) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ServersSettingsPage(),
                  ),
                ),
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
