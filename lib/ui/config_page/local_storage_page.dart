import 'package:animebox/core/config.dart';
import 'package:animebox/main.dart';
import 'package:animebox/ui/config_page/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LocalStoragePage extends StatefulWidget {
  const LocalStoragePage({super.key});

  @override
  State<LocalStoragePage> createState() => _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.localStorageSettingsHeader),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("Data"),
            tiles: [
              CustomSettingsTile(
                child: Card.filled(
                  child: SettingsTile(
                    title: const Text("Data Path"),
                    value: Text(config.localStorage.dataPath),
                    onPressed: (context) async =>
                        await _bottomSheetDataPath(context),
                  ),
                ),
              ),
              SettingsTile.switchTile(
                title: const Text("Delete watched chapters"),
                description: const Text(
                  "After you watch a chapter, Anime Box will delete it automatically to save space",
                ),
                initialValue: config.localStorage.deleteWatchedChapters,
                onToggle: (value) => setState(
                  () => config.localStorage.deleteWatchedChapters = value,
                ),
              ),
            ],
          ),

          SettingsSection(
            title: const Text("Backup"),
            tiles: [
              SettingsTile.switchTile(
                title: const Text("Enable Backups"),
                description: const Text(
                  "Backup configurations and other data of Anime Box.\nNote: This doesn't backup your series by default",
                ),
                initialValue: config.localStorage.enableBackup,
                onToggle: (value) =>
                    setState(() => config.localStorage.enableBackup = value),
              ),
              SettingsTile.switchTile(
                title: const Text("Enable Automatic Backups"),
                description: const Text(
                  "Execute Backup operations automatically on a time interval",
                ),
                enabled: config.localStorage.enableBackup,
                initialValue: config.localStorage.enableAutomaticBackups,
                onToggle: (value) => setState(
                  () => config.localStorage.enableAutomaticBackups = value,
                ),
              ),
              CustomSettingsTile(
                child: ClickableDropdownMenu(
                  enabled:
                      config.localStorage.enableBackup &&
                      config.localStorage.enableAutomaticBackups,
                  title: const Text("Backups Interval"),
                  value: config.localStorage.backupInterval,
                  items: readableIntervalsMenu,
                  onChanged: (value) => setState(() {
                    config.localStorage.backupInterval = value ?? 3;
                    config.update();
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _bottomSheetDataPath(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Do you want to change the route to Anime Box's data?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Note: This operation will also move the existing data in the previous path.",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text("Current data path:", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 4),

            Row(
              children: [
                Expanded(
                  child: Text(
                    config.localStorage.dataPath,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsetsGeometry.symmetric(vertical: 20),
              child: Center(
                child: FilledButton.tonal(
                  onPressed: () async {
                    final result = await FilePicker.getDirectoryPath();
                    if (result != null) {
                      setState(() {
                        config.localStorage.dataPath = result;
                      });
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: Text(l10n.change),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
