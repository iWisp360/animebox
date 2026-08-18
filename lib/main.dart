import 'package:animebox/core/error/presentation/views/error_app.dart';
import 'package:animebox/core/injector.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:animebox/ui/routes.dart';
import 'package:animebox/ui/themes/presentation/views/themes_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    MediaKit.ensureInitialized();

    final sharedPreferences = await SharedPreferences.getInstance();
    final packageInfo = await PackageInfo.fromPlatform();

    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
          packageInfoProvider.overrideWith((ref) => packageInfo),
        ],
        child: TranslationProvider(child: const AnimeBoxApp()),
      ),
    );
  } on Exception catch (e, st) {
    runApp(
      TranslationProvider(
        child: ErrorApp(exception: e, stackTrace: st),
      ),
    );
  }
}

class AnimeBoxApp extends ConsumerWidget {
  const AnimeBoxApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainRouter = ref.watch(mainRouterProvider);

    return ThemesBuilder(
      builder: (context, themeData) => MaterialApp.router(
        title: 'Anime Box',
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: AppLocaleUtils.supportedLocales,
        locale: TranslationProvider.of(context).flutterLocale,
        theme: themeData,
        debugShowCheckedModeBanner: false,
        routerConfig: mainRouter,
      ),
    );
  }
}
