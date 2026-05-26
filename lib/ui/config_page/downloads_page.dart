import 'package:animebox/core/config.dart';
import 'package:animebox/main.dart';
import 'package:animebox/ui/config_page/utils.dart';
import 'package:animebox/ui/widgets/integer_stepper.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.downloadsSettingsHeader),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),

      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("Downloader Options"),
            tiles: [
              SettingsTile.switchTile(
                initialValue: config.downloads.unmeteredNetworksOnly,
                onToggle: (value) => setState(() {
                  config.downloads.unmeteredNetworksOnly = value;
                  config.update();
                }),
                title: const Text("Download using unmetered networks only"),
                description: const Text(
                  "Pause existing and new downloads when network is metered",
                ),
              ),

              SettingsTile(
                title: const Text("Downloaded Chapters Format"),
                description: const Text(
                  "Save chapters using the specified format",
                ),
                onPressed: (context) async {
                  final String? format = await showDialog(
                    context: context,
                    builder: (context) => TextFormDialog(
                      title: const Text("Downloaded Chapters Format"),
                      initialValue: config.downloads.downloadedChaptersFormat,
                    ),
                  );

                  if (format != null) {
                    if (!format.contains("%n")) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "A '%n' format should be present at least",
                            ),
                          ),
                        );
                      }

                      return;
                    }
                    setState(() {
                      config.downloads.downloadedChaptersFormat = format;
                    });
                    await config.update();
                  }
                },
                trailing: Text(config.downloads.downloadedChaptersFormat),
              ),

              SettingsTile(
                title: const Text("Max Download Threads"),
                description: const Text(
                  "Max threads per download. May increase download speed. Use with caution.",
                ),
                trailing: IntegerStepper(
                  minValue: 1,
                  maxValue: 16,
                  initialValue: config.downloads.maxThreads,
                  onChanged: (value) {
                    config.downloads.maxThreads = value;
                    config.update();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
