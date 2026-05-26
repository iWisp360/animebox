import 'package:animebox/core/config.dart';
import 'package:animebox/main.dart';
import 'package:animebox/src/rust/api/app/languages.dart';
import 'package:animebox/src/rust/api/app/sections.dart';
import 'package:animebox/src/rust/api/app/themes.dart';
import 'package:animebox/ui/config_page/utils.dart';
import 'package:animebox/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  final GlobalKey _globalKeyColorPalette = GlobalKey();
  final GlobalKey _globalKeyStartPage = GlobalKey();
  final GlobalKey _globalKeyLanguage = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.appearanceSettingsHeader),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("Theme"),
            tiles: [
              CustomSettingsTile(
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SegmentedButton(
                    segments: [
                      ButtonSegment(
                        label: Text(
                          modeToString[ThemeModes.system] ??
                              ThemeModes.system.name,
                        ),
                        value: ThemeModes.system,
                      ),
                      ButtonSegment(
                        label: Text(
                          modeToString[ThemeModes.dark] ?? ThemeModes.dark.name,
                        ),
                        value: ThemeModes.dark,
                        enabled:
                            darkThemes.contains(config.appearance.theme) ||
                            multiThemes.contains(config.appearance.theme),
                      ),
                      ButtonSegment(
                        label: Text(
                          modeToString[ThemeModes.light] ??
                              ThemeModes.light.name,
                        ),
                        value: ThemeModes.light,
                        enabled:
                            lightThemes.contains(config.appearance.theme) ||
                            multiThemes.contains(config.appearance.theme),
                      ),
                    ],
                    onSelectionChanged: (newThemeMode) {
                      setState(() {
                        final brightness = switch (newThemeMode.first) {
                          ThemeModes.dark => Brightness.dark,
                          ThemeModes.light => Brightness.light,
                          ThemeModes.system => MediaQuery.platformBrightnessOf(
                            context,
                          ),
                        };

                        var allowedThemes =
                            switch (brightness) {
                              Brightness.dark => darkThemes,
                              Brightness.light => lightThemes,
                            } +
                            multiThemes;

                        if (!allowedThemes.contains(config.appearance.theme)) {
                          config.appearance.theme = Themes.dynamic_;
                        }

                        config.appearance.mode = newThemeMode.first;
                        config.update();

                        themeManager?.setTheme(switch (newThemeMode.first) {
                          ThemeModes.system => ThemeMode.system,
                          ThemeModes.dark => ThemeMode.dark,
                          ThemeModes.light => ThemeMode.light,
                        });
                      });
                    },
                    selected: {config.appearance.mode},
                  ),
                ),
              ),

              SettingsTile(
                onPressed: globalKeyListener(_globalKeyColorPalette),
                title: Text(l10n.colorPalette),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    key: _globalKeyColorPalette,
                    alignment: AlignmentGeometry.centerRight,
                    value: config.appearance.theme,
                    items: [
                      for (var theme
                          in (Theme.of(context).brightness == Brightness.dark
                              ? multiThemes + darkThemes
                              : multiThemes + lightThemes))
                        DropdownMenuItem(
                          value: theme,
                          child: Text(themeToString[theme] ?? theme.name),
                        ),
                    ],
                    onChanged: (newTheme) => newTheme != null
                        ? setState(() {
                            config.appearance.theme = newTheme;
                            config.update();
                          })
                        : (),
                  ),
                ),
              ),

              SettingsTile.switchTile(
                title: Text(l10n.amoledBackground),
                description: const Text(
                  "Use black background to save battery on AMOLED screens",
                ),
                initialValue: config.appearance.pitchBlack,
                onToggle: (enabled) => setState(() {
                  config.appearance.pitchBlack = enabled;
                  config.update();
                }),
              ),
            ],
          ),

          SettingsSection(
            title: const Text("Customization"),
            tiles: [
              SettingsTile(
                onPressed: globalKeyListener(_globalKeyStartPage),
                title: Text(l10n.startPage),
                description: const Text("Page where Anime Box starts"),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    key: _globalKeyStartPage,
                    alignment: AlignmentGeometry.centerRight,
                    value: config.appearance.initScreen,
                    items: [
                      for (var tab in HomeTabs.values)
                        DropdownMenuItem(
                          value: tab,
                          child: Text(homeTabToString[tab]!),
                        ),
                    ],
                    onChanged: (newTab) => newTab != null
                        ? setState(() {
                            config.appearance.initScreen = newTab;
                            config.update();
                          })
                        : (),
                  ),
                ),
              ),

              SettingsTile.switchTile(
                title: Text(l10n.relativeDates),
                description: Text(
                  config.appearance.relativeDates ? "Tuesday, May 23" : "23/05",
                ),

                initialValue: config.appearance.relativeDates,
                onToggle: (enabled) => setState(() {
                  config.appearance.relativeDates = enabled;
                  config.update();
                }),
              ),

              SettingsTile(
                onPressed: globalKeyListener(_globalKeyLanguage),
                title: Text(l10n.language),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    key: _globalKeyLanguage,
                    alignment: AlignmentGeometry.centerRight,
                    value: config.appearance.lang,
                    items: [
                      for (var lang in AppLanguages.values)
                        DropdownMenuItem(
                          value: lang,
                          child: Text(appLanguageToString[lang]!),
                        ),
                    ],
                    onChanged: (newLang) => newLang != null
                        ? setState(() {
                            config.appearance.lang = newLang;
                            config.update();
                          })
                        : (),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final modeToString = {
  ThemeModes.dark: l10n.darkMode,
  ThemeModes.system: l10n.systemMode,
  ThemeModes.light: l10n.lightMode,
};

final themeToString = {
  Themes.dynamic_: l10n.dynamicTheme,
  Themes.catppuccinLatte: "Catppuccin Latte",
  Themes.catppuccinFrappe: "Catppuccin Frappe",
  Themes.catppuccinMacchiato: "Catppuccin Macchiato",
  Themes.catppuccinMocha: "Catppuccin Mocha",
  Themes.nord: "Nord",
  Themes.tokyoNight: "Tokyo Night",
  Themes.matrix: "Matrix",
  Themes.monochrome: "Monochrome",
};

final homeTabToString = {
  HomeTabs.home: l10n.homePage,
  HomeTabs.library_: l10n.libraryPage,
  HomeTabs.search: l10n.searchPage,
};

const appLanguageToString = {
  AppLanguages.es: "Español",
  AppLanguages.jp: "日本語",
  AppLanguages.en: "English",
  AppLanguages.ru: "Русский",
  AppLanguages.zh: "中文",
  AppLanguages.ar: "العربية",
};
