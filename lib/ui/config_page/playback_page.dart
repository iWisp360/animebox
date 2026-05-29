import 'package:animebox/main.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class PlaybackPage extends StatefulWidget {
  const PlaybackPage({super.key});

  @override
  State<PlaybackPage> createState() => _PlaybackPageState();
}

class _PlaybackPageState extends State<PlaybackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.playbackSettingsHeader),
      ),

      // I don't feel like doing this now
      body: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
        ),
        sections: const [SettingsSection(tiles: [])],
      ),
    );
  }
}
