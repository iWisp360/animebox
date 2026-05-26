import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late String logsPath;
final loggerInstance = _AnimeBoxLogger();

late final Logger logger;

void crashNoGUI({Object? error, StackTrace? stackTrace}) {
  if (loggerInstance._initialized) {
    final consoleLogger = Logger(
      printer: loggerInstance.prettyPrinter,
      output: ConsoleOutput(),
    );

    consoleLogger.f("Crash!!!");

    if (error != null) {
      consoleLogger.f("$error\n${stackTrace ?? ""}");
    }

    exit(255);
  }
}

class _AnimeBoxLogger {
  bool _initialized = false;
  final prettyPrinter = PrettyPrinter(
    colors: kDebugMode ? true : false,
    printEmojis: true,
    methodCount: 48,
    errorMethodCount: 48,
  );

  Future<void> init() async {
    logsPath = join((await getTemporaryDirectory()).path);
    var logsFile = File(join(logsPath, "animebox-flutter.log"));

    bool logsPathExists = false;
    try {
      await logsFile.create(recursive: true);
      logsPathExists = true;
    } finally {
      logger = Logger(
        level: kDebugMode ? Level.debug : Level.info,
        printer: prettyPrinter,

        output: logsPathExists ? FileOutput(file: logsFile) : ConsoleOutput(),
      );

      _initialized = true;
    }
  }

  void dispose() {
    logger.close();
    _initialized = false;
  }
}
