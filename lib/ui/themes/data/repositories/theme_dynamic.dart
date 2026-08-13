import 'dart:io';

import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class ThemeDynamic extends AnimeBoxTheme {
  @override
  Future<ThemeData> buildTheme({
    ThemeMode? themeMode,
    bool? pitchBlack,
    required BuildContext context,
  }) async {
    final actualBrightness = getBrightness(themeMode ?? .system, context);
    final colorScheme = await getColorScheme(actualBrightness);

    final themeData = ThemeData.from(colorScheme: colorScheme);

    return (pitchBlack ?? false)
        ? themeData.copyWith(scaffoldBackgroundColor: Colors.black)
        : themeData;
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
