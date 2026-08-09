import 'package:animebox/core/configs/presentation/views/config_builder.dart';
import 'package:animebox/core/themes/data/repositories/theme_fallback.dart';
import 'package:animebox/core/themes/presentation/controllers/themes_controller.dart';
import 'package:flutter/material.dart';

class ThemesBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;
  final ThemesController themesController;

  const ThemesBuilder({
    super.key,
    required this.builder,
    ThemesController? themesController,
  }) : themesController = themesController ?? const ThemesController();

  @override
  State<ThemesBuilder> createState() => _ThemesBuilderState();
}

class _ThemesBuilderState extends State<ThemesBuilder> {
  @override
  Widget build(BuildContext context) {
    return ConfigBuilder(
      builder: (configController, context) => FutureBuilder(
        future: widget.themesController.chooseTheme(configController, context),
        builder: (context, snapshot) {
          final themeData =
              snapshot.data ??
              ThemeData.from(
                colorScheme: ThemeFallback().fallbackColorScheme(
                  MediaQuery.platformBrightnessOf(context),
                ),
              );

          return AnimatedTheme(
            data: themeData,
            child: widget.builder(context, themeData),
          );
        },
      ),
    );
  }
}
