import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeFallback extends AnimeBoxTheme {
  @override
  Future<ThemeData> buildTheme(
    AnimeBoxConfig config,
    BuildContext context,
  ) async {
    return ThemeData.from(
      colorScheme: fallbackColorScheme(getBrightness(config, context)),
    );
  }
}
