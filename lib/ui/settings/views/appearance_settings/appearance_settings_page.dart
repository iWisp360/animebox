import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/core/configs/domain/providers/config_provider.dart';
import 'package:animebox/core/dates/data/repositories/dates_repository_impl.dart';
import 'package:animebox/core/dates/domain/repositories/dates_repository.dart';
import 'package:animebox/core/i18n/domain/entities/language.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/ui/settings/views/appearance_settings/language_set_page.dart';
import 'package:animebox/ui/settings/views/page_builder.dart';
import 'package:animebox/ui/settings/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:settings_ui/settings_ui.dart';

class AppearanceSettingsPage extends ConsumerWidget {
  final DatesRepository datesRepository;
  const AppearanceSettingsPage({super.key, DatesRepository? datesRepository})
    : datesRepository = datesRepository ?? const DatesRepositoryImpl();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);
    final appearanceSettingsTranslations = translations.settings.appearance;

    return Scaffold(
      appBar: AppBar(title: Text(appearanceSettingsTranslations.title)),
      body: SettingsPageBuilder(
        builder: (context, config) => SettingsList(
          lightTheme: getSettingsThemeData(context),
          darkTheme: getSettingsThemeData(context),
          sections: [
            SettingsSection(
              title: Text(appearanceSettingsTranslations.themeMode.title),
              tiles: [
                CustomSettingsTile(
                  child: Padding(
                    padding: const .symmetric(vertical: 16),
                    child: Center(
                      child: SegmentedButton(
                        multiSelectionEnabled: false,
                        onSelectionChanged: (mode) async {
                          final provider = ref.read(configProvider.notifier);

                          await provider.change(
                            config.copyWith.appearance(themeMode: mode.first),
                          );
                        },
                        segments: [
                          for (final mode in ThemeMode.values)
                            ButtonSegment(
                              value: mode,
                              label: SizedBox(
                                width: 60,
                                child: Text(switch (mode) {
                                  .system =>
                                    appearanceSettingsTranslations
                                        .themeMode
                                        .system,
                                  .dark =>
                                    appearanceSettingsTranslations
                                        .themeMode
                                        .dark,
                                  .light =>
                                    appearanceSettingsTranslations
                                        .themeMode
                                        .light,
                                }, textAlign: .center),
                              ),
                            ),
                        ],
                        selected: {config.appearance.themeMode},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SettingsSection(
              tiles: [
                SettingsTile.switchTile(
                  initialValue: config.appearance.pitchBlack,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith(
                          appearance: config.appearance.copyWith(
                            pitchBlack: value,
                          ),
                        ),
                      ),
                  enabled: _getBrightness(config.appearance, context) == .dark,
                  title: Text(appearanceSettingsTranslations.pitchBlack.title),
                  description: Text(
                    appearanceSettingsTranslations.pitchBlack.description
                        .trim(),
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: const Text("Application"),
              tiles: [
                SettingsTile.navigation(
                  title: Text(translations.language.title),
                  value: Text(switch (config.appearance.lang) {
                    .system => translations.language.system.title,
                    _ => translations.language.actual,
                  }),
                  onPressed: (context) async {
                    final Language? changedLang = await Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => const LanguageSetPage(),
                          ),
                        );

                    if (changedLang != null) {
                      await ref
                          .read(configProvider.notifier)
                          .change(
                            config.copyWith.appearance(lang: changedLang),
                          );
                    }
                  },
                ),
                SettingsTile.switchTile(
                  initialValue: config.appearance.relativeDates,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(config.copyWith.appearance(relativeDates: value)),
                  title: Text(
                    appearanceSettingsTranslations.relativeDates.title,
                  ),
                  description: Text(
                    _getFormat(config.appearance.relativeDates).format(.now()),
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: const Text("Series"),
              tiles: [
                SettingsTile.switchTile(
                  initialValue: config.appearance.reverseEpisodesOrder,
                  onToggle: (value) => ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith.appearance(reverseEpisodesOrder: value),
                      ),
                  title: const Text("Reverse Episodes Order"),
                  description: Text(
                    config.appearance.reverseEpisodesOrder
                        ? "The last episode is at the top of the list"
                        : "The first episode is at the top of the list",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DateFormat _getFormat(bool relativeDates) => (relativeDates)
      ? datesRepository.getRelativeDateFormat()
      : datesRepository.getAbsoluteDateFormat();

  Brightness _getBrightness(
    AppearanceConfig appearanceConfig,
    BuildContext context,
  ) => switch (appearanceConfig.themeMode) {
    .dark => .dark,
    .light => .light,
    .system => MediaQuery.platformBrightnessOf(context),
  };
}
