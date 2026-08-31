import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injector.g.dart';

class AlreadyHandledException {
  @override
  String toString() =>
      "This provider should be handled on other part of the code";
}

@riverpod
SharedPreferences sharedPreferences(Ref ref) => throw AlreadyHandledException();

@riverpod
PackageInfo packageInfo(Ref ref) => throw AlreadyHandledException();
