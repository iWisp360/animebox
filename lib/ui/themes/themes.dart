import 'package:animebox/core/config.dart';
import 'package:animebox/src/rust/api/app/themes.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

ThemeManager? themeManager;

ThemeData? darkTheme;
ThemeData? lightTheme;

class ThemeManager {
  Color accentColorDark;
  Color accentColorLight;

  final ValueNotifier<ThemeMode> themeModeNotifier;

  ThemeData getTheme({bool? useDark}) {
    bool isDark = useDark ?? themeModeNotifier.value == ThemeMode.dark;

    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: isDark ? accentColorDark : accentColorLight,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }

  void setTheme(final ThemeMode mode) {
    themeModeNotifier.value = mode;
  }

  void setGlobalThemes() {
    lightTheme = getTheme(useDark: false);
    darkTheme = getTheme(useDark: true);
  }

  ThemeManager({
    required this.accentColorLight,
    required this.accentColorDark,
    required this.themeModeNotifier,
  });

  static Future<void> init() async {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    final colorScheme = corePalette?.toColorScheme();

    final initialThemeMode = switch (config.appearance.mode) {
      ThemeModes.system => ThemeMode.system,
      ThemeModes.dark => ThemeMode.dark,
      ThemeModes.light => ThemeMode.light,
    };

    themeManager = ThemeManager(
      accentColorDark: colorScheme == null
          ? const ColorScheme.dark().primary
          : colorScheme.primary,

      accentColorLight: colorScheme == null
          ? const ColorScheme.light().primary
          : colorScheme.primary,

      themeModeNotifier: ValueNotifier(initialThemeMode),
    );
  }
}

class ThemedApp extends StatefulWidget {
  final Widget child;
  const ThemedApp({super.key, required this.child});

  @override
  State<ThemedApp> createState() => _ThemedAppState();
}

class _ThemedAppState extends State<ThemedApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeManager!.themeModeNotifier,
      builder: (context, mode, child) => AnimatedTheme(
        data: themeManager!.getTheme(
          useDark: switch (mode) {
            ThemeMode.dark => true,
            ThemeMode.light => false,
            ThemeMode.system => null,
          },
        ),
        child: child!,
      ),
      child: widget.child,
    );
  }
}

const List<Themes> darkThemes = [
  Themes.catppuccinMacchiato,
  Themes.catppuccinMocha,
  Themes.matrix,
  Themes.tokyoNight,
];

const List<Themes> lightThemes = [
  Themes.catppuccinFrappe,
  Themes.catppuccinLatte,
];

const List<Themes> multiThemes = [
  Themes.dynamic_,
  Themes.nord,
  Themes.monochrome,
];
