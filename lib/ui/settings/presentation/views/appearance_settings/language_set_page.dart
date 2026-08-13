import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/core/i18n/domain/entities/language.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguageSetPage extends StatelessWidget {
  const LanguageSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.i18n.language.title)),
      body: SettingsList(
        lightTheme: getSettingsThemeData(context),
        darkTheme: getSettingsThemeData(context),

        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                title: Text(context.i18n.language.system.title),
                value: Text(context.i18n.language.system.description),
                onPressed: (context) =>
                    Navigator.of(context).pop(Language.system),
              ),
              for (final lang in Language.values)
                if (lang != .system)
                  SettingsTile.navigation(
                    title: Text(lang.nativeName!),
                    value: Text(switch (lang) {
                      .en => context.i18n.language.english,
                      .es => context.i18n.language.spanish,
                      _ => context.i18n.language.unknown,
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
