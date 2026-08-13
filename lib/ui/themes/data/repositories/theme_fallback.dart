import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeFallback extends AnimeBoxTheme {
  @override
  ThemeData buildTheme({
    ThemeMode? themeMode,
    bool? pitchBlack,
    required BuildContext context,
  }) {
    return ThemeData.from(
      colorScheme: fallbackColorScheme(
        getBrightness(themeMode: themeMode ?? .system, context: context),
      ),
    );
  }
}
