import 'dart:async';

import 'package:flutter/material.dart';

abstract class AnimeBoxTheme {
  FutureOr<ThemeData> buildTheme({
    required ThemeMode themeMode,
    bool? pitchBlack,
    required BuildContext context,
  });

  Brightness getBrightness({
    required ThemeMode themeMode,
    required BuildContext context,
  }) {
    switch (themeMode) {
      case .system:
        return MediaQuery.platformBrightnessOf(context);
      case .dark:
        return Brightness.dark;
      case .light:
        return Brightness.light;
    }
  }

  ColorScheme fallbackColorScheme(Brightness brightness) =>
      ColorScheme.fromSeed(
        seedColor: Colors.cyan.shade500,
        brightness: brightness,
      );
}
