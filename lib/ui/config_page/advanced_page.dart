import 'package:animebox/core/config.dart';
import 'package:animebox/main.dart';
import 'package:animebox/ui/widgets/textform_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class AdvancedPage extends StatefulWidget {
  const AdvancedPage({super.key});

  @override
  State<AdvancedPage> createState() => _AdvancedPageState();
}

class _AdvancedPageState extends State<AdvancedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.advancedSettingsHeader),
      ),
      body: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
        ),
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: const Text("User Agent"),
                value: Text(config.advanced.userAgent),
                onPressed: (context) async {
                  final String? inputResult = await showDialog(
                    context: context,
                    builder: (context) => TextFormDialog(
                      title: const Text("User Agent"),
                      initialValue: config.advanced.userAgent,
                    ),
                  );

                  if (inputResult != null) {
                    setState(() {
                      config.advanced.userAgent = inputResult;
                    });
                    await config.update();
                  }
                },
              ),

              SettingsTile.switchTile(
                title: const Text("Debugging Logs"),
                initialValue: config.advanced.debugLogs || kDebugMode,
                enabled: !kDebugMode,
                description: const Text(
                  "Increase verbosity of the logs. This may reduce performance.${kDebugMode ? " Always enabled because build type is Debug" : ""}",
                ),
                onToggle: (value) => setState(() {
                  config.advanced.debugLogs = value;
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
