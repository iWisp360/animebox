abstract class FilesRepository {
  Future<String> readFromFile(String path);
  Future<void> writeToFile(String path, String contents, {bool append = false});
}
