import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/core/i18n/domain/entities/language.dart';
import 'package:animebox/ui/settings/presentation/views/appearance_settings/language_set_page.dart';
import 'package:animebox/ui/settings/presentation/views/page_builder.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AppearanceSettingsPage extends ConsumerWidget {
  const AppearanceSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appearanceSettingsTranslations = context.i18n.settings.appearance;

    return Scaffold(
      appBar: AppBar(title: Text(appearanceSettingsTranslations.title)),
      body: SettingsPageBuilder(
        builder: (context, config) => SettingsList(
          lightTheme: getSettingsThemeData(context),
          darkTheme: getSettingsThemeData(context),
          sections: [
            SettingsSection(
              title: const Text("Theme mode"),
              tiles: [
                CustomSettingsTile(
                  child: Padding(
                    padding: const .symmetric(vertical: 16),
                    child: Center(
                      child: SegmentedButton(
                        multiSelectionEnabled: false,
                        onSelectionChanged: (mode) => ref
                            .read(configProvider.notifier)
                            .change(
                              config.copyWith(
                                appearance: config.appearance.copyWith(
                                  themeMode: mode.first,
                                ),
                              ),
                            ),
                        segments: [
                          for (final mode in ThemeMode.values)
                            ButtonSegment(
                              value: mode,
                              label: SizedBox(
                                width: 54,
                                child: Text(switch (mode) {
                                  .system => "System",
                                  .dark => "Dark",
                                  .light => "Light",
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
                  title: Text(appearanceSettingsTranslations.pitchBlack.title),
                  description: Text(
                    appearanceSettingsTranslations.pitchBlack.description,
                  ),
                ),
                SettingsTile.navigation(
                  title: Text(context.i18n.language.title),
                  value: Text(switch (config.appearance.lang) {
                    .system => context.i18n.language.system.title,
                    _ => context.i18n.language.actual,
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
                            config.copyWith(
                              appearance: config.appearance.copyWith(
                                lang: changedLang,
                              ),
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
