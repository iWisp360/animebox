import 'dart:io';

import 'package:dart_redb/models/redb.dart';

abstract class Database {
  Database(this._path);

  final String _path;

  bool initialized = false;

  void initialize();
  void dispose();

  dynamic readValue({required String key, required String table});
  Map<String, dynamic> readTableValues(String table);
  void writeValue({
    required String key,
    required dynamic value,
    required String table,
  });

  void removeValue({required String key, required String table});
  bool valueExists({required String key, required String table});
}

class DatabaseRedb extends Database {
  DatabaseRedb(super.path);

  late final Redb _database;

  @override
  void initialize() {
    _database = Redb(File(_path))..createDatabase();
    initialized = true;
  }

  @override
  void dispose() => _database.dispose();

  @override
  void writeValue({
    required String key,
    required value,
    required String table,
  }) {
    _database.writeValue(table: table, key: key, value: value);
  }

  @override
  dynamic readValue({required String key, required String table}) {
    _database.defineTable(table);
    return _database.getValue(table: table, key: key);
  }

  @override
  Map<String, dynamic> readTableValues(String table) {
    _database.defineTable(table);
    return _database.readTableValues(table);
  }

  @override
  void removeValue({required String key, required String table}) {
    _database.removeValue(table: table, key: key);
  }

  @override
  bool valueExists({required String key, required String table}) {
    _database.defineTable(table);
    return _database.valueExists(table: table, key: key);
  }
}
