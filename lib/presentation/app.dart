import 'package:animebox/core/enums.dart';
import 'package:animebox/core/logs.dart';
import 'package:animebox/presentation/home.dart';
import 'package:animebox/widgets/themes.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeBoxApp extends StatelessWidget {
  const AnimeBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ThemePair theme;

        if (themeController.themeId == SupportedThemes.dynamic) {
          theme = _createDynamicTheme(lightDynamic, darkDynamic);
        } else {
          theme =
              AnimeBoxThemes.getThemeById(themeController.themeId) ??
              AnimeBoxThemes.themes[SupportedThemes.fallback]!;
        }

        return MaterialApp(
          title: "Anime Box",
          debugShowCheckedModeBanner: false,
          home: AnimeBoxHome(),

          themeMode: themeController.mode,
          theme: theme.light,
          darkTheme: theme.dark,
        );
      },
    );
  }
}

ThemePair _createDynamicTheme(ColorScheme? lightColors, ColorScheme? darkColors) {
  if (lightColors != null && darkColors != null) {
    return ThemePair(
      light: ThemeData.from(colorScheme: lightColors, useMaterial3: true),
      dark: ThemeData.from(colorScheme: darkColors, useMaterial3: true),
    );
  } else {
    logger.w("Using fallback theme as Dynamic Theme couldn't be created");
    return AnimeBoxThemes.themes[SupportedThemes.fallback]!;
  }
}
