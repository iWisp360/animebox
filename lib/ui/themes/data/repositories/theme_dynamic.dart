import 'dart:io';

import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class ThemeDynamic extends AnimeBoxTheme {
  @override
  Future<ThemeData> buildTheme({
    required ThemeMode themeMode,
    bool? pitchBlack,
    required Brightness systemBrightness,
  }) async {
    final Brightness actualBrightness = switch (themeMode) {
      .light => .light,
      .dark => .dark,
      .system => systemBrightness,
    };

    final colorScheme = await getColorScheme(actualBrightness);
    final themeData = ThemeData.from(colorScheme: colorScheme);

    return (actualBrightness == .dark && (pitchBlack ?? false))
        ? themeData.copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: colorScheme.surfaceContainerLowest,
            ),
            navigationRailTheme: NavigationRailThemeData(
              backgroundColor: colorScheme.surfaceContainerLowest,
            ),
          )
        : themeData.copyWith(
            navigationRailTheme: NavigationRailThemeData(
              backgroundColor: colorScheme.surfaceContainer,
            ),
          );
  }

  Future<ColorScheme> getColorScheme(Brightness actualBrightness) async {
    if (Platform.isAndroid) {
      final corePalette = await DynamicColorPlugin.getCorePalette();

      final colorScheme = corePalette?.toColorScheme(
        brightness: actualBrightness,
      );

      if (colorScheme != null) {
        return colorScheme;
      }
    }

    final accentColor = await DynamicColorPlugin.getAccentColor();

    if (accentColor != null) {
      return .fromSeed(seedColor: accentColor, brightness: actualBrightness);
    } else {
      return fallbackColorScheme(actualBrightness);
    }
  }
}
