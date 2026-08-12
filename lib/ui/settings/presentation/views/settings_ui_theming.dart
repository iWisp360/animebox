import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

SettingsThemeData getSettingsThemeData(BuildContext context) =>
    SettingsThemeData(
      settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
    );
