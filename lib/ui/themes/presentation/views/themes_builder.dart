import 'package:animebox/ui/themes/data/providers/theme_provider.dart';
import 'package:animebox/ui/themes/data/repositories/theme_fallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemesBuilder extends ConsumerWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;

  const ThemesBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeBoxTheme = ref.watch(themeDataProvider(context));

    return animeBoxTheme.when(
      loading: () {
        final themeData = ThemeFallback().buildTheme(context: context);
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
        final themeData = ThemeFallback().buildTheme(context: context);
        return AnimatedTheme(
          data: themeData,
          child: builder(context, themeData),
        );
      },
    );
  }
}
