import 'dart:io';

import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/themes/domain/repositories/theme_repository.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class ThemeDynamic extends AnimeBoxTheme {
  @override
  Future<ThemeData> buildTheme(
    AnimeBoxConfig config,
    BuildContext context,
  ) async {
    if (context.mounted) {
      final actualBrightness = getBrightness(config, context);

      final colorScheme = await getColorScheme(actualBrightness);
      final themeData = ThemeData.from(colorScheme: colorScheme);

      return (config.appearance.pitchBlack)
          ? themeData.copyWith(scaffoldBackgroundColor: Colors.black)
          : themeData;
    }

    throw Exception("Unmounted context exception");
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
