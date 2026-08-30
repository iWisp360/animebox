import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/ui/settings/views/page_builder.dart';
import 'package:animebox/ui/settings/views/settings_ui_theming.dart';
import 'package:animebox/ui/utils/quantity_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class LibrarySettingsPage extends ConsumerWidget {
  const LibrarySettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final librarySettingsTranslations = ref
        .watch(i18nProvider)
        .settings
        .library;

    return Scaffold(
      appBar: AppBar(title: Text(librarySettingsTranslations.title)),
      body: SettingsPageBuilder(
        builder: (context, config) => SettingsList(
          lightTheme: getSettingsThemeData(context),
          darkTheme: getSettingsThemeData(context),
          sections: [
            SettingsSection(
              title: Text(
                librarySettingsTranslations.autoUpdateSeriesSection.title,
              ),
              tiles: [
                SettingsTile.switchTile(
                  initialValue: config.library.libraryAutoUpdateParams.enable,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith(
                          library: config.library.copyWith(
                            libraryAutoUpdateParams: config
                                .library
                                .libraryAutoUpdateParams
                                .copyWith(enable: value),
                          ),
                        ),
                      ),
                  title: Text(
                    librarySettingsTranslations
                        .autoUpdateSeriesSection
                        .enable
                        .title,
                  ),
                ),
                SettingsTile(
                  enabled: config.library.libraryAutoUpdateParams.enable,
                  title: Text(
                    librarySettingsTranslations
                        .autoUpdateSeriesSection
                        .interval
                        .title,
                  ),
                  description: Text(
                    librarySettingsTranslations
                        .autoUpdateSeriesSection
                        .interval
                        .description,
                  ),
                  trailing: QuantityChanger(
                    initialQuantity:
                        config.library.libraryAutoUpdateParams.interval,
                    onQuantityChanged: (value) => ref
                        .read(configProvider.notifier)
                        .change(
                          config.copyWith(
                            library: config.library.copyWith(
                              libraryAutoUpdateParams: config
                                  .library
                                  .libraryAutoUpdateParams
                                  .copyWith(interval: value),
                            ),
                          ),
                        ),
                  ),
                ),
                SettingsTile.switchTile(
                  enabled: config.library.libraryAutoUpdateParams.enable,
                  initialValue:
                      config.library.libraryAutoUpdateParams.allowMobileData,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith(
                          library: config.library.copyWith(
                            libraryAutoUpdateParams: config
                                .library
                                .libraryAutoUpdateParams
                                .copyWith(allowMobileData: value),
                          ),
                        ),
                      ),
                  title: Text(
                    librarySettingsTranslations
                        .autoUpdateSeriesSection
                        .allowMeteredNetworks
                        .title,
                  ),
                ),
                SettingsTile.switchTile(
                  enabled: config.library.libraryAutoUpdateParams.enable,
                  initialValue: config
                      .library
                      .libraryAutoUpdateParams
                      .avoidCompletedSeries,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith(
                          library: config.library.copyWith(
                            libraryAutoUpdateParams: config
                                .library
                                .libraryAutoUpdateParams
                                .copyWith(avoidCompletedSeries: value),
                          ),
                        ),
                      ),
                  title: Text(
                    librarySettingsTranslations
                        .autoUpdateSeriesSection
                        .avoidCompletedSeries
                        .title,
                  ),
                  description: Text(
                    librarySettingsTranslations
                        .autoUpdateSeriesSection
                        .avoidCompletedSeries
                        .description,
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
