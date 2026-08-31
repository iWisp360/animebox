import 'package:animebox/core/configs/domain/providers/config_provider.dart';
import 'package:animebox/ui/themes/domain/entities/mapped_brightness.dart';
import 'package:animebox/ui/themes/domain/repositories/theme_repository.dart';
import 'package:animebox/ui/themes/presentation/controllers/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ThemeData> themeData(Ref ref, MappedBrightness systemBrightness) async {
  final animeBoxTheme = ref.watch(animeBoxThemeBuilderProvider);
  final appearanceConfig = await ref.watch(configProvider.future);

  return animeBoxTheme.buildTheme(
    systemBrightness: systemBrightness.toBrightness(),
    themeMode: appearanceConfig.appearance.themeMode,
    pitchBlack: appearanceConfig.appearance.pitchBlack,
  );
}

@riverpod
ThemesController themeController(Ref ref) => const ThemesController();

@Riverpod(keepAlive: true)
class AnimeBoxThemeBuilder extends _$AnimeBoxThemeBuilder {
  @override
  AnimeBoxTheme build() {
    return ref.read(themeControllerProvider).themeImplementation();
  }
}
