// Never gonna give you up
// WIP: Backup utility & download management

import "package:flutter/material.dart";
import "package:http/http.dart";
import "package:media_kit/media_kit.dart";
import "package:oxanime/ui/video.dart";
import "package:oxanime/utilities/logs.dart";
import "package:oxanime/utilities/preferences.dart";
import "package:oxanime/utilities/sources.dart";
import "package:oxanime/utilities/video_url_parser.dart";

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

  var response = await YourUpload.getVideoFromUrl("https://www.yourupload.com/embed/H4a5mQX3H4w5");
  final headers = <String, String>{};
  headers["referer"] = "https://www.yourupload.com/";
  runApp(OxAnimeMainApp(videoUrl: response!, headers: headers));
}

Future<void> initLogger() async {
  logger.i(
    "Initializing Logger... What? but this is a logger :/\nxD But a logger that logs to a file",
  );
  logger = await OxAnimeLogger.makeLogger();
}

class OxAnimeMainApp extends StatelessWidget {
  const OxAnimeMainApp({super.key, required this.videoUrl, required this.headers});
  final String videoUrl;
  final Map<String, String> headers;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OxAnime",
      home: VideoPlayerScreen(videoUrl: videoUrl, headers: headers),
      debugShowCheckedModeBanner: false,
    );
  }
}
