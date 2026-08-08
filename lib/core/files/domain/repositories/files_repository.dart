import 'dart:io';

abstract class FilesRepository {
  Future<String> readFromFile(String path);
  Future<void> writeToFile(String path, String contents, {bool append = false});
  Future<void> ensureDirectory(Directory directory);
}
