import 'package:animebox/ui/settings/presentation/views/page_builder.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LocalStorageSettingsPage extends StatelessWidget {
  const LocalStorageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SettingsPageBuilder(
        builder: (context, config) => SettingsList(
          lightTheme: getSettingsThemeData(context),
          darkTheme: getSettingsThemeData(context),
          sections: [],
        ),
      ),
    );
  }
}
