import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/ui/themes/domain/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeBoxThemeProvider = AsyncNotifierProvider(
  () => AnimeBoxThemeProvider(),
);

final themeDataProvider = FutureProvider.family<ThemeData, BuildContext>((
  ref,
  context,
) async {
  final animeBoxTheme = await ref.watch(animeBoxThemeProvider.future);
  final appearanceConfig = await ref.watch(configProvider.future);

  if (context.mounted) {
    return animeBoxTheme.buildTheme(
      context: context,
      themeMode: appearanceConfig.appearance.themeMode,
      pitchBlack: appearanceConfig.appearance.pitchBlack,
    );
  } else {
    return ThemeData.light();
  }
});
