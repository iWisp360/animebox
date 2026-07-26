import 'dart:async';

import 'package:animebox/anime_sources.dart';
import 'package:animebox/core/config.dart';
import 'package:animebox/core/logging.dart';
import 'package:animebox/l10n/app_localizations.dart';
import 'package:animebox/src/rust/api/app/logging.dart';
import 'package:animebox/ui/error_tab.dart';
import 'package:animebox/ui/main_page/main_page.dart';
import 'package:animebox/ui/themes/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animebox/src/rust/frb_generated.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path/path.dart' as path;

late AppLocalizations l10n;
bool failedInit = false;

late Exception failure;
StackTrace? initStackTrace;

Future<void> main() async {
  bool rustFailed = false;
  WidgetsFlutterBinding.ensureInitialized();
  await loggerInstance.init();

  logger.d("Initializing Anime Box Core");
  try {
    await RustLib.init();
  } catch (e, t) {
    logger.f("While initializing the Anime Box Core: $e");
    logger.f(t);
    logger.f(
      "Hint: Probably the .so file isn't present in any of the paths at LD_LIBRARY_PATH",
    );

    failure = Exception("$e");
    initStackTrace = t;

    failedInit = true;
    rustFailed = true;
  }

  if (!rustFailed) {
    initLogger(
      settings: CoreLoggerSettings(
        path: path.join(logsPath, "animebox-core.log"),
        level: kDebugMode ? LogLevel.debug : LogLevel.info,
      ),
    );

    logger.d("Initializing config");
    try {
      await configController.init();
    } catch (e, st) {
      failedInit = true;
      initStackTrace = st;
      failure = Exception("$e");
    }

    if (!failedInit) {
      logger.d("Configuring theming");
      await ThemeManager.init();

      try {
        MediaKit.ensureInitialized();
      } catch (e, st) {
        failure = Exception("$e");
        initStackTrace = st;
        failedInit = true;
      }
    }
  }

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    _throwErrorScreen(details.exception, details.stack);
  };

  PlatformDispatcher.instance.onError = (exception, stacktrace) {
    _throwErrorScreen(exception, stacktrace);
    return true;
  };

  await AnimeSourcesController.init();
  runApp(const AnimeBox());
}

class AnimeBox extends StatefulWidget {
  const AnimeBox({super.key});

  @override
  State<AnimeBox> createState() => _AnimeBoxState();
}

class _AnimeBoxState extends State<AnimeBox> {
  ThemeMode? themeMode;
  bool? isPitchBlack;

  @override
  void initState() {
    super.initState();

    if (themeManager != null) {
      themeManager?.setGlobalThemes();
      themeManager?.themeModeNotifier.addListener(
        () => setState(() {
          themeMode = themeManager?.themeModeNotifier.value;
        }),
      );
      themeManager?.usePitchBlack.addListener(
        () => setState(() {
          isPitchBlack = themeManager?.usePitchBlack.value;
        }),
      );
    }

    isPitchBlack = config.appearance.pitchBlack;
  }

  @override
  Widget build(BuildContext context) {
    return failedInit
        ? MaterialApp(
            home: ErrorTab(
              isRecoverable: false,
              exception: failure,
              stackTrace: initStackTrace,
            ),
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
          )
        : ThemedApp(
            isPitchBlack: isPitchBlack ?? false,
            child: TooltipVisibility(
              visible: false,
              child: MaterialApp(
                home: const TranslatedApp(child: HomePage()),
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: lightTheme,
                darkTheme: isPitchBlack ?? false ? pitchBlackTheme : darkTheme,
                themeMode: themeMode,
              ),
            ),
          );
  }
}

class TranslatedApp extends StatelessWidget {
  final Widget child;
  const TranslatedApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;

    return child;
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void _throwErrorScreen(Object exception, StackTrace? stackTrace) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    final Exception finalException = exception is Exception
        ? exception
        : Exception(exception.toString());

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ErrorTab(
          isRecoverable: true,
          exception: finalException,
          stackTrace: stackTrace,
        ),
      ),
    );
  });
}
