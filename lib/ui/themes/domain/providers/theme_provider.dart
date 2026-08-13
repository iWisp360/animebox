import 'dart:async';

import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/configs/domain/entities/appearance.dart';
import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:animebox/ui/themes/presentation/controllers/themes_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeBoxThemeProvider extends AsyncNotifier<AnimeBoxTheme> {
  ThemesController themesController = const ThemesController();
  AppColorPalette? _colorPalette;

  @override
  FutureOr<AnimeBoxTheme> build() async {
    final config = await ref.read(configProvider.future);

    return themesController.themeImplementation(
      _colorPalette ??= config.appearance.colorPalette,
    );
  }

  void changeTheme(AppColorPalette colorPalette) {
    state = AsyncValue.data(themesController.themeImplementation(colorPalette));
  }
}
