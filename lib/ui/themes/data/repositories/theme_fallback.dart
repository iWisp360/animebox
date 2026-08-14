import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeFallback extends AnimeBoxTheme {
  @override
  ThemeData buildTheme({
    ThemeMode? themeMode,
    bool? pitchBlack,
    required Brightness systemBrightness,
  }) {
    return ThemeData.from(
      colorScheme: fallbackColorScheme(switch (themeMode) {
        .light => .light,
        .dark => .dark,
        _ => systemBrightness,
      }),
    );
  }
}
