import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:animebox/core/error/presentation/views/error_app.dart';
import 'package:animebox/core/injector.dart';
import 'package:animebox/core/l10n/localizations/app_localizations.dart';
import 'package:animebox/core/themes/presentation/views/themes_builder.dart';
import 'package:animebox/features/mainPage/presentation/views/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';

Future<void> main() async {
  try {
    final configController = ConfigController();
    await configController.loadFromFile();

    MediaKit.ensureInitialized();

    setupInjector();

    runApp(const ProviderScope(child: AnimeBoxApp()));
  } on Exception catch (e, st) {
    runApp(ErrorApp(exception: e, stackTrace: st));
  }
}

class AnimeBoxApp extends StatelessWidget {
  const AnimeBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemesBuilder(
      builder: (context, themeData) => MaterialApp(
        title: 'Anime Box',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const MainPageView(),
      ),
    );
  }
}
