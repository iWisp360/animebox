import 'package:animebox/ui/themes/data/providers/controller_provider.dart';
import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeBoxThemeProvider extends Notifier<AnimeBoxTheme> {
  @override
  AnimeBoxTheme build() {
    return ref.read(themeControllerProvider).themeImplementation();
  }
}
