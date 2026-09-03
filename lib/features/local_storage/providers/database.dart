import 'package:animebox/core/database/database.dart';
import 'package:animebox/core/files/data/datasources/internal_data_directory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

Duration? noRetry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: noRetry)
FutureOr<Database> database(Ref ref) async {
  final db = DatabaseRedb(await databasePath());
  db.initialize();
  return db;
}
