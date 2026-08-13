import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:animebox/core/error/presentation/views/error_app.dart';
import 'package:animebox/core/injector.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:animebox/ui/themes/presentation/views/themes_builder.dart';
import 'package:animebox/ui/mainPage/presentation/views/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await LocaleSettings.useDeviceLocale();

    final configController = ConfigController();
    await configController.loadFromFile();

    MediaKit.ensureInitialized();

    setupInjector(sharedPreferences: await SharedPreferences.getInstance());

    runApp(
      ProviderScope(child: TranslationProvider(child: const AnimeBoxApp())),
    );
  } on Exception catch (e, st) {
    runApp(
      TranslationProvider(
        child: ErrorApp(exception: e, stackTrace: st),
      ),
    );
  }
}

class AnimeBoxApp extends StatelessWidget {
  const AnimeBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemesBuilder(
      builder: (context, themeData) => MaterialApp(
        title: 'Anime Box',
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: AppLocaleUtils.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const MainPageView(),
      ),
    );
  }
}
