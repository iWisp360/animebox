import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

const String animeboxDataFolderName = "AnimeBox";

Future<Directory> animeBoxInternalData() async {
  if (Platform.isAndroid) {
    return await _animeboxInternalAndroidData();
  } else if (Platform.isLinux) {
    return await _animeboxInternalLinuxData();
  } else {
    throw UnimplementedError();
  }
}

Future<Directory> _animeboxInternalLinuxData() async {
  var homeDir = Platform.environment["HOME"];

  final joinedPath = homeDir == null
      ? join((await getApplicationSupportDirectory()).path)
      : join(homeDir, ".animebox");

  return Directory(joinedPath);
}

Future<Directory> _animeboxInternalAndroidData() =>
    getApplicationSupportDirectory();

Future<String> databasePath() async {
  final internalPath = await animeBoxInternalData();
  return join(internalPath.path, "animebox.redb");
}

Future<Directory> cachePath() async {
  final cachePath = await getApplicationCacheDirectory();
  return Directory(join(cachePath.path, "animebox"))..create();
}
