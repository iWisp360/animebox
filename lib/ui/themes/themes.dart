import 'package:animebox/core/config.dart';
import 'package:animebox/src/rust/api/app/themes.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

ThemeManager? themeManager;

ThemeData? darkTheme;
ThemeData? pitchBlackTheme;
ThemeData? lightTheme;

class ThemeManager extends ChangeNotifier {
  final Color accentColorDark;
  final Color accentColorLight;

  final ValueNotifier<ThemeMode> themeModeNotifier;
  final ValueNotifier<bool> usePitchBlack;

  ThemeData getTheme({bool? useDark, bool? isPitchBlack}) {
    bool isDark = useDark ?? themeModeNotifier.value == ThemeMode.dark;
    bool pitchBlack = isPitchBlack ?? usePitchBlack.value;

    final themeData = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: isDark ? accentColorDark : accentColorLight,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );

    return themeData.copyWith(
      scaffoldBackgroundColor: pitchBlack
          ? Colors.black
          : themeData.colorScheme.surface,

      appBarTheme: AppBarTheme(
        backgroundColor: pitchBlack
            ? Colors.black
            : themeData.colorScheme.surface,

        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }

  void setTheme(final ThemeMode mode) {
    themeModeNotifier.value = mode;
  }

  void setPitchBlack(final bool value) {
    usePitchBlack.value = value;
  }

  void setGlobalThemes() {
    lightTheme = getTheme(useDark: false, isPitchBlack: false);
    darkTheme = getTheme(useDark: true, isPitchBlack: false);
    pitchBlackTheme = getTheme(useDark: true, isPitchBlack: true);
  }

  ThemeManager({
    required this.accentColorLight,
    required this.accentColorDark,
    required this.themeModeNotifier,
    required this.usePitchBlack,
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
      usePitchBlack: ValueNotifier(config.appearance.pitchBlack),
    );
  }
}

class ThemedApp extends StatefulWidget {
  final Widget child;
  final bool isPitchBlack;
  const ThemedApp({super.key, required this.child, required this.isPitchBlack});

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
          isPitchBlack: widget.isPitchBlack,
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
