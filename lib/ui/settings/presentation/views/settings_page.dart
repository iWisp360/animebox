import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/injector.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageVersion = ref.watch(
      packageInfoProvider.select((info) => info.version),
    );

    final translations = ref.watch(i18nProvider);
    final settingsTranslations = translations.settings;

    return Scaffold(
      appBar: AppBar(title: Text(settingsTranslations.pageHeader)),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                title: Text(settingsTranslations.appearance.title),
                description: Text(settingsTranslations.appearance.description),
                leading: const Icon(Icons.palette_outlined),
                onPressed: (context) => context.go("/settings/appearance"),
              ),
              SettingsTile.navigation(
                title: Text(settingsTranslations.downloads.title),
                description: Text(settingsTranslations.downloads.description),
                leading: const Icon(Icons.download_outlined),
                onPressed: (context) => context.go("/settings/downloads"),
              ),
              SettingsTile.navigation(
                title: Text(settingsTranslations.library.title),
                description: Text(settingsTranslations.library.description),
                leading: const Icon(Icons.video_library_outlined),
                onPressed: (context) => context.go("/settings/library"),
              ),
              SettingsTile.navigation(
                title: const Text("Local Storage"),
                description: const Text("Set your local storage preferences"),
                leading: const Icon(Icons.storage_outlined),
                onPressed: (context) => context.go("/settings/localStorage"),
              ),
              SettingsTile.navigation(
                title: const Text("Metadata Trackers"),
                description: const Text(
                  "Trackers gives you the information and schedules for your anime",
                ),
                leading: const Icon(Icons.sync_outlined),
                onPressed: (context) => context.go("/settings/metadata"),
              ),
              SettingsTile.navigation(
                title: const Text("Playback"),
                description: const Text(
                  "Configure the video player for Anime Box",
                ),
                leading: const Icon(Icons.video_settings_outlined),
                onPressed: (context) => context.go("/settings/playback"),
              ),
              SettingsTile.navigation(
                title: Text(settingsTranslations.servers.title),
                description: Text(settingsTranslations.servers.description),
                leading: const Icon(Icons.cloud_outlined),
                onPressed: (context) => context.go("/settings/servers"),
              ),
              SettingsTile.navigation(
                title: Text(settingsTranslations.advanced.title),
                description: Text(settingsTranslations.advanced.description),
                leading: const Icon(Icons.data_object_outlined),
                onPressed: (context) => context.go("/settings/advanced"),
              ),
              SettingsTile.navigation(
                title: Text(settingsTranslations.about.title),
                description: Text("Anime Box v$packageVersion"),
                leading: const Icon(Icons.info_outlined),
                onPressed: (context) => context.go("/settings/about"),
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
