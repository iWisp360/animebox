import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlreadyHandledException {
  @override
  String toString() =>
      "This provider should be handled on other part of the code";
}

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw AlreadyHandledException(),
);

final packageInfoProvider = Provider<PackageInfo>(
  (ref) => throw AlreadyHandledException(),
);
