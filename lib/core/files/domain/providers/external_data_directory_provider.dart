import 'dart:async';
import 'dart:io';

import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:animebox/core/global_info_feedback/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:saf/saf.dart';

class ExternalDataDirectoryProvider extends AsyncNotifier<Uri> {
  Saf get saf => Saf();
  Future<Uri> get _defaultUriPath async =>
      Uri.parse((await _defaultPath()).path);

  @override
  FutureOr<Uri> build() async {
    final config = ref.watch(configProvider);

    final Uri directoryUri = await config.maybeWhen(
      data: (config) async {
        final dataPath = config.localStorage.dataPath;

        if (dataPath == null) {
          return _defaultUriPath;
        } else {
          return dataPath;
        }
      },
      orElse: () => _defaultUriPath,
    );

    final directory = Directory(directoryUri.path);
    if (!Platform.isAndroid) {
      try {
        await directory.create(recursive: true);
        if (!await directory.exists()) {
          throw const FileSystemException();
        }
      } catch (e) {
        rethrow;
      }
    } else {
      final config = await ref.read(configProvider.future);
      try {
        if (config.localStorage.dataPath == null) {
          await directory.create(recursive: true);
        } else {
          await saf.mkdirp(directoryUri.toString(), []);
        }
      } on SafNotFoundException {
        final notifier = ref.read(globalNotificationController.notifier);

        notifier.setState(
          messageBuilder: (i18n, ref) =>
              "Couldn't get the current data path, so Anime Box restored it to the default path",
          priority: .warning,
        );

        notifier.set(enabled: true);
        await ref
            .read(configProvider.notifier)
            .change(config.copyWith.localStorage(dataPath: null));
      }
    }

    return directoryUri;
  }

  Future<Directory> _defaultPath() async {
    final dataPath = await _defaultPathByPlatform();

    return Directory(join(dataPath.path, animeboxDataFolderName));
  }

  Future<void> switchToDefaultPath() async {
    final config = await ref.read(configProvider.future);

    await ref
        .read(configProvider.notifier)
        .change(config.copyWith.localStorage(dataPath: null));
  }

  Future<Directory> _defaultPathByPlatform() {
    if (Platform.isLinux) {
      return _defaultPathLinux();
    } else if (Platform.isAndroid) {
      return _defaultPathAndroid();
    } else {
      throw UnimplementedError();
    }
  }

  Future<Directory> _defaultPathLinux() => animeBoxInternalData();
  Future<Directory> _defaultPathAndroid() => animeBoxInternalData();
}
