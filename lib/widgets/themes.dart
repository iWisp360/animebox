import "package:animebox/core/enums.dart";
import "package:catppuccin_flutter/catppuccin_flutter.dart";
import "package:flutter/material.dart";
import "package:animebox/core/preferences.dart";

class ThemePair {
  final ThemeData dark;
  final ThemeData light;
  ThemePair({required this.dark, required this.light});
}

class AnimeBoxThemes {
  static final themes = {
    SupportedThemes.fallback: ThemePair(dark: ThemeData.dark(), light: ThemeData.light()),
    SupportedThemes.catppuccin: ThemePair(
      dark: catppuccinTheme(catppuccin.mocha),
      light: catppuccinTheme(catppuccin.latte),
    ),
  };

  static ThemePair? getThemeById(SupportedThemes id) {
    return AnimeBoxThemes.themes[id];
  }
}

class ThemeController with ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  SupportedThemes _themeId = SupportedThemes.dynamicColors;
  SupportedThemes get themeId => _themeId;

  Future<void> load() async {
    final settingsMode = await preferences.getString("themeMode");
    _mode = _parseThemeMode(settingsMode);

    final settingsTheme = await preferences.getString("currentTheme");
    _themeId = _parseThemeId(settingsTheme);

    notifyListeners();
  }

  Future<void> setTheme(SupportedThemes theme) async {
    if (theme == _themeId) return;
    _themeId = theme;
    notifyListeners();
    await preferences.setString("currentTheme", theme.name);
  }

  Future<void> setMode(ThemeMode mode) async {
    if (mode == _mode) return;
    _mode = mode;
    notifyListeners();
    preferences.setString("themeMode", mode.name);
  }
}

ThemeMode _parseThemeMode(String? settingsMode) {
  if (settingsMode == ThemeMode.light.name) {
    return ThemeMode.light;
  } else if (settingsMode == ThemeMode.dark.name) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.system;
  }
}

SupportedThemes _parseThemeId(String? themeId) {
  for (var theme in SupportedThemes.values) {
    if (themeId == theme.name) {
      return theme;
    }
  }
  preferences.setString("currentTheme", SupportedThemes.dynamicColors.name);
  return SupportedThemes.dynamicColors;
}

ThemeData catppuccinTheme(Flavor flavor) {
  Color primaryColor = flavor.mauve;
  Color secondaryColor = flavor.pink;
  return ThemeData(
    useMaterial3: true,

    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(color: flavor.text, fontSize: 20, fontWeight: FontWeight.bold),
      backgroundColor: flavor.base,
      foregroundColor: flavor.mantle,
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      error: flavor.surface2,
      onSurface: flavor.text,
      onError: flavor.red,
      onPrimary: primaryColor,
      onSecondary: secondaryColor,
      primary: flavor.crust,
      secondary: flavor.mantle,
      surface: flavor.base,
    ),

    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: flavor.surface1,
      backgroundColor: flavor.surface0,
    ),

    textTheme: const TextTheme().apply(bodyColor: flavor.text, displayColor: primaryColor),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0),
  );
}
