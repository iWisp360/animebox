import 'package:animebox/main.dart';
import 'package:animebox/ui/config_page/about_page.dart';
import 'package:animebox/ui/config_page/advanced_page.dart';
import 'package:animebox/ui/config_page/appearance_page.dart';
import 'package:animebox/ui/config_page/downloads_page.dart';
import 'package:animebox/ui/config_page/library_page.dart';
import 'package:animebox/ui/config_page/local_storage_page.dart';
import 'package:animebox/ui/config_page/metadata_page.dart';
import 'package:animebox/ui/config_page/playback_page.dart';
import 'package:animebox/ui/config_page/servers_page.dart';
import 'package:animebox/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Settings"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).push(pageRoute(context, const AboutPage())),
            icon: const Icon(Icons.info),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: Text(l10n.appearanceSettings),
                leading: const Icon(Icons.palette),
                description: const Text(
                  "Options for Theming, Fonts, Language, etc",
                ),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const AppearancePage())),
              ),
              SettingsTile(
                title: const Text("Metadata"),
                leading: const Icon(Icons.dataset),
                description: const Text(
                  "Sources for Series Information and Tracking",
                ),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const MetadataPage())),
              ),
              SettingsTile(
                title: const Text("Downloads"),
                leading: const Icon(Icons.cloud_download),
                description: const Text(
                  "Configuration for the Anime Box Downloader",
                ),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const DownloadsPage())),
              ),
              SettingsTile(
                title: Text(l10n.playbackSettings),
                leading: const Icon(Icons.video_settings),
                description: const Text("Options for the Video Player"),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const PlaybackPage())),
              ),
              SettingsTile(
                title: Text(l10n.librarySettings),
                leading: const Icon(Icons.video_library),
                description: const Text("Options for Library Customization"),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const LibraryPage())),
              ),
              SettingsTile(
                title: Text(l10n.localStorageSettings),
                leading: const Icon(Icons.storage),
                description: const Text(
                  "Options for Anime Box's Path Handling",
                ),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const LocalStoragePage())),
              ),
              SettingsTile(
                title: Text(l10n.serversSettings),
                leading: const Icon(Icons.cloud),
                description: const Text(
                  "Configure Servers to Get Chapters for Series",
                ),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const ServersPage())),
              ),
              SettingsTile(
                title: const Text("Advanced"),
                leading: const Icon(Icons.data_object),
                description: const Text(
                  "Touch these only if you know what you're doing!",
                ),
                onPressed: (context) => Navigator.of(
                  context,
                ).push(pageRoute(context, const AdvancedPage())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
