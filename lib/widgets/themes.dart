import 'package:flutter/material.dart';
import "package:animebox/core/preferences.dart";

class AnimeBoxThemes {
  static final defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 49, 50, 68)),
  );

  static final defaultThemeDark = ThemeData.dark();
}

class ThemeController with ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  Future<void> load() async {
    final index = await preferences.getInt('themeMode') ?? 2;
    _mode = ThemeMode.values[index];
    notifyListeners();
  }

  Future<void> setMode(ThemeMode mode) async {
    _mode = mode;
    notifyListeners();
    preferences.setInt('themeMode', mode.index);
  }
}
