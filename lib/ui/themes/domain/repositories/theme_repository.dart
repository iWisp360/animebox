import 'dart:async';

import 'package:flutter/material.dart';

abstract class AnimeBoxTheme {
  FutureOr<ThemeData> buildTheme({
    required ThemeMode themeMode,
    bool? pitchBlack,
    required Brightness systemBrightness,
  });

  ColorScheme fallbackColorScheme(Brightness brightness) =>
      ColorScheme.fromSeed(
        seedColor: Colors.cyan.shade500,
        brightness: brightness,
      );
}
