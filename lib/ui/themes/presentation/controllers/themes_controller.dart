import 'package:animebox/ui/themes/data/repositories/theme_dynamic.dart';
import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';

class ThemesController {
  AnimeBoxTheme themeImplementation() => ThemeDynamic();

  const ThemesController();
}
