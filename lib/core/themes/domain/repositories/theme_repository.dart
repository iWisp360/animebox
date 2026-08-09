import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:flutter/material.dart';

abstract class AnimeBoxTheme {
  Future<ThemeData> buildTheme(AnimeBoxConfig config, BuildContext context);
  Brightness getBrightness(AnimeBoxConfig config, BuildContext context) {
    switch (config.appearance.themeMode) {
      case .system:
        return MediaQuery.platformBrightnessOf(context);
      case .dark:
        return Brightness.dark;
      case .light:
        return Brightness.light;
    }
  }

  ColorScheme fallbackColorScheme(Brightness brightness) {
    switch (brightness) {
      case .light:
        return const ColorScheme.light();
      case .dark:
        return const ColorScheme.dark();
    }
  }
}
