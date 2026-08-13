import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/ui/themes/data/repositories/theme_dynamic.dart';
import 'package:animebox/ui/themes/data/repositories/theme_fallback.dart';
import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';

class ThemesController {
  AnimeBoxTheme themeImplementation(AppColorPalette colorPalette) {
    switch (colorPalette) {
      case .dynamic:
        return ThemeDynamic();

      default:
        return ThemeFallback();
    }
  }

  const ThemesController();
}
