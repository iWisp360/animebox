// Never gonna give you up
// WIP: Backup utility & download management

import "package:flutter/material.dart";
import "package:oxanime/ui/home.dart";
import "package:oxanime/ui/video.dart";
import "package:http/http.dart";
import "package:oxanime/utilities/logs.dart";
import "package:oxanime/utilities/networking.dart";
import "package:oxanime/utilities/video_url_parser.dart";
import "package:oxanime/utilities/preferences.dart";
import "package:oxanime/utilities/sources.dart";
import "package:media_kit/media_kit.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  try {
    sources = await Source.getSources();
  } catch (e) {}
  try {
    logger.i("Logging to file");
    await initLogger();
  } catch (e) {
    logger.e(e);
  }

  if (await preferences.getBool("logging") == false) {
    logger.i("Disabling Logs");
    logger.close();
  }
}

Future<void> initLogger() async {
  logger.i(
    "Initializing Logger... What? but this is a logger :/\nxD But a logger that logs to a file",
  );
  logger = await OxAnimeLogger.makeLogger();
}

class OxAnimeMainApp extends StatelessWidget {
  const OxAnimeMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "OxAnime", home: Placeholder(), debugShowCheckedModeBanner: false);
  }
}
