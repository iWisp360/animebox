import 'package:animebox/ui/themes/data/providers/theme_provider.dart';
import 'package:animebox/ui/themes/data/repositories/theme_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemesBuilder extends ConsumerWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;

  const ThemesBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final systemBrightness = MediaQuery.platformBrightnessOf(context);
    final animeBoxTheme = ref.watch(themeDataProvider(systemBrightness));

    return animeBoxTheme.when(
      loading: () {
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        final themeData = ThemeFallback().buildTheme(
          systemBrightness: systemBrightness,
        );
        return AnimatedTheme(
          data: themeData,
          child: builder(context, themeData),
        );
      },
      data: (themeData) {
        return AnimatedTheme(
          data: themeData,
          child: builder(context, themeData),
        );
      },
      error: (e, st) {
        final systemBrightness = MediaQuery.platformBrightnessOf(context);
        final themeData = ThemeFallback().buildTheme(
          systemBrightness: systemBrightness,
        );
        return AnimatedTheme(
          data: themeData,
          child: builder(context, themeData),
        );
      },
    );
  }
}
