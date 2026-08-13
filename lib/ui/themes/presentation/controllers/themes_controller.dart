import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:animebox/ui/themes/data/repositories/theme_dynamic.dart';
import 'package:animebox/ui/themes/data/repositories/theme_fallback.dart';
import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemesController {
  Future<ThemeData> chooseTheme(
    ConfigController configController,
    BuildContext context,
  ) async {
    final config = configController.current;
    final theme = themeImplementation(config);
    return theme.buildTheme(config, context);
  }

  AnimeBoxTheme themeImplementation(AnimeBoxConfig config) {
    switch (config.appearance.colorPalette) {
      case AppColorPalette.dynamic:
        return ThemeDynamic();

      default:
        return ThemeFallback();
    }
  }

  const ThemesController();
}
