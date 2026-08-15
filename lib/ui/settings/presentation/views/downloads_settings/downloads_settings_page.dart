import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/ui/settings/presentation/views/downloads_settings/episodes_format/episodes_format_dialog.dart';
import 'package:animebox/ui/settings/presentation/views/page_builder.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:animebox/ui/widgets/quantity_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class DownloadsSettingsPage extends ConsumerWidget {
  const DownloadsSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadsSettingsTranslations = context.i18n.settings.downloads;

    return Scaffold(
      appBar: AppBar(title: Text(downloadsSettingsTranslations.title)),
      body: SettingsPageBuilder(
        builder: (context, config) => SettingsList(
          lightTheme: getSettingsThemeData(context),
          darkTheme: getSettingsThemeData(context),
          sections: [
            SettingsSection(
              title: Text(
                downloadsSettingsTranslations.connectivitySection.title,
              ),
              tiles: [
                SettingsTile.switchTile(
                  initialValue: config.downloads.unmeteredNetworksOnly,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith(
                          downloads: config.downloads.copyWith(
                            unmeteredNetworksOnly: value,
                          ),
                        ),
                      ),
                  title: Text(
                    downloadsSettingsTranslations
                        .connectivitySection
                        .unmeteredNetworksOnly
                        .title,
                  ),
                  description: Text(
                    downloadsSettingsTranslations
                        .connectivitySection
                        .unmeteredNetworksOnly
                        .description,
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: Text(
                downloadsSettingsTranslations.downloaderSection.title,
              ),
              tiles: [
                SettingsTile.navigation(
                  title: Text(
                    downloadsSettingsTranslations
                        .downloaderSection
                        .episodesFormat
                        .title,
                  ),
                  description: Text(
                    downloadsSettingsTranslations
                        .downloaderSection
                        .episodesFormat
                        .description,
                  ),
                  trailing: Text(config.downloads.downloadedEpisodesFormat),
                  onPressed: (context) async {
                    final String? newFormat = await showDialog(
                      context: context,
                      builder: (context) => EpisodesFormatDialog(
                        initialFormat:
                            config.downloads.downloadedEpisodesFormat,
                      ),
                    );

                    if (newFormat != null) {
                      await ref
                          .read(configProvider.notifier)
                          .change(
                            config.copyWith(
                              downloads: config.downloads.copyWith(
                                downloadedEpisodesFormat: newFormat,
                              ),
                            ),
                          );
                    }
                  },
                ),
                SettingsTile(
                  title: Text(
                    downloadsSettingsTranslations
                        .downloaderSection
                        .maxConcurrentDownloads
                        .title,
                  ),
                  description: Text(
                    downloadsSettingsTranslations
                        .downloaderSection
                        .maxConcurrentDownloads
                        .description,
                  ),
                  trailing: QuantityChanger(
                    initialQuantity: config.downloads.maxConcurrentDownloads,
                    minQuantity: 1,
                    maxQuantity: 32,
                    onQuantityChanged: (value) {
                      if (context.mounted) {
                        ref
                            .read(configProvider.notifier)
                            .change(
                              config.copyWith(
                                downloads: config.downloads.copyWith(
                                  maxConcurrentDownloads: value,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                ),
                SettingsTile(
                  title: Text(
                    downloadsSettingsTranslations
                        .downloaderSection
                        .maxDownloadThreads
                        .title,
                  ),
                  description: Text(
                    downloadsSettingsTranslations
                        .downloaderSection
                        .maxDownloadThreads
                        .description
                        .trim(),
                  ),
                  trailing: QuantityChanger(
                    initialQuantity: config.downloads.maxDownloadThreads,
                    minQuantity: 1,
                    maxQuantity: 16,
                    onQuantityChanged: (value) {
                      if (context.mounted) {
                        ref
                            .read(configProvider.notifier)
                            .change(
                              config.copyWith(
                                downloads: config.downloads.copyWith(
                                  maxDownloadThreads: value,
                                ),
                              ),
                            );
                      }
                    },
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
