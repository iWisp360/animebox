import 'dart:async';
import 'dart:io';

import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

class ExternalDataDirectoryProvider extends AsyncNotifier<Directory> {
  @override
  FutureOr<Directory> build() async {
    final config = ref.watch(configProvider);

    final Directory directory = await config.when(
      data: (config) {
        final dataPath = config.localStorage.dataPath;

        if (dataPath == null) {
          return defaultPath();
        } else {
          return Directory(join(dataPath, animeboxDataFolderName));
        }
      },
      error: (_, _) => defaultPath(),
      loading: () => defaultPath(),
    );

    try {
      await directory.create(recursive: true);
      return directory;
    } catch (e) {
      rethrow;
    }
  }

  Future<Directory> defaultPath() async {
    final dataPath = await defaultPathByPlatform();

    return Directory(join(dataPath.path, animeboxDataFolderName));
  }

  Future<Directory> defaultPathByPlatform() {
    if (Platform.isLinux) {
      return _defaultPathLinux();
    } else if (Platform.isAndroid) {
      return _defaultPathAndroid();
    } else {
      throw UnimplementedError();
    }
  }

  Future<Directory> _defaultPathLinux() => animeBoxInternalData();
  Future<Directory> _defaultPathAndroid() async {
    final moviesPath = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_MOVIES,
    );

    return Directory(moviesPath);
  }
}
