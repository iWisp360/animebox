// Never gonna give you up
// WIP: Backup utility & download management

import "package:flutter/material.dart";
import "package:oxanime/ui/home.dart";
import "package:oxanime/utilities/html_parser.dart";
import "package:oxanime/utilities/logs.dart";
import "package:oxanime/utilities/networking.dart";
import "package:oxanime/utilities/preferences.dart";
import "package:oxanime/utilities/sources.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sources = await Source.getSources();
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

  var results = await sources[0].query("Date A Live");

  print(results[0].mainUrl);

  runApp(OxAnimeMainApp());
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
    return MaterialApp(
      title: "OxAnime",
      home: OxAnimeHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
