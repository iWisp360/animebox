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
    final corePalette = await DynamicColorPlugin.getCorePalette();

    if (!context.mounted) throw Exception("Unmounted context exception");

    final actualBrightness = getBrightness(config, context);

    final colorScheme =
        corePalette?.toColorScheme(brightness: actualBrightness) ??
        fallbackColorScheme(actualBrightness);

    final themeData = ThemeData.from(colorScheme: colorScheme);

    return (config.appearance.pitchBlack)
        ? themeData.copyWith(scaffoldBackgroundColor: Colors.black)
        : themeData;
  }
}
