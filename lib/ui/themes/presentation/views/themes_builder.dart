import 'package:animebox/ui/themes/data/repositories/theme_fallback.dart';
import 'package:animebox/ui/themes/domain/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemesBuilder extends ConsumerWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;

  const ThemesBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final systemBrightness = MediaQuery.platformBrightnessOf(context);
    final animeBoxTheme = ref.watch(
      themeDataProvider(.fromBrightness(systemBrightness)),
    );

    return animeBoxTheme.maybeWhen(
      orElse: () {
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
        final textTheme = themeData.textTheme.apply(fontFamily: "Inter");

        return AnimatedTheme(
          data: themeData.copyWith(textTheme: textTheme),
          child: builder(context, themeData),
        );
      },
    );
  }
}
