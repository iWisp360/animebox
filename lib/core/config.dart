import 'dart:io';

import 'package:animebox/core/logging.dart';
import 'package:animebox/src/rust/api/app/configuration/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

ConfigController configController = _ConfigControllerImpl();
late AnimeBoxConfig config;

abstract class ConfigController {
  Future<void> init();
}

class _ConfigControllerImpl implements ConfigController {
  @override
  Future<void> init() async {
    final configPath = (await getApplicationSupportDirectory()).path;

    logger.d("Configuration is stored at $configPath");
    config = await AnimeBoxConfig.initConfig(path: configPath);

    if (config.dataPathUninitialized) {
      await initDataPath();
    }
  }

  Future<void> initDataPath() async {
    config.localStorage.dataPath =
        ((Platform.isAndroid
                    ? (await getExternalStorageDirectory())
                    : (await getDownloadsDirectory())) ??
                await getApplicationSupportDirectory())
            .path;

    if (!Platform.isAndroid) {
      config.localStorage.dataPath = join(
        config.localStorage.dataPath,
        "AnimeBox",
      );
      await Directory(config.localStorage.dataPath).create(recursive: true);
    }

    config.dataPathUninitialized = false;

    await config.update();
  }
}
