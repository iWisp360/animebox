import 'dart:io';

import 'package:animebox/core/files/domain/repositories/files_repository.dart';

class FilesRepositoryImpl implements FilesRepository {
  @override
  Future<void> writeToFile(
    String path,
    String contents, {
    bool append = false,
  }) async {
    final file = File(path);
    await file.writeAsString(
      contents,
      mode: append ? .writeOnlyAppend : .writeOnly,
    );
  }

  @override
  Future<String> readFromFile(String path) async {
    return File(path).readAsString();
  }
}
