import 'package:animebox/core/i18n/domain/entities/language.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/ui/settings/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguageSetPage extends ConsumerWidget {
  const LanguageSetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);

    return Scaffold(
      appBar: AppBar(title: Text(translations.language.title)),
      body: SettingsList(
        lightTheme: getSettingsThemeData(context),
        darkTheme: getSettingsThemeData(context),

        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                title: Text(translations.language.system.title),
                value: Text(translations.language.system.description),
                onPressed: (context) =>
                    Navigator.of(context).pop(Language.system),
              ),
              for (final lang in Language.values)
                if (lang != .system)
                  SettingsTile.navigation(
                    title: Text(lang.nativeName!),
                    value: Text(switch (lang) {
                      .en => translations.language.english,
                      .es => translations.language.spanish,
                      _ => translations.language.unknown,
                    }),
                    onPressed: (context) => Navigator.of(context).pop(lang),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
