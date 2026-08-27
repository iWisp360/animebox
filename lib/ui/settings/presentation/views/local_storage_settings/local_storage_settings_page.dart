import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/files/data/providers/external_data_directory_provider.dart';
import 'package:animebox/ui/settings/presentation/views/page_builder.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class LocalStorageSettingsPage extends ConsumerWidget {
  const LocalStorageSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final externalDataPath = ref.watch(externalDataDirectoryProvider);

    AbstractSettingsTile externalDataTile({
      required BuildContext context,
      required AnimeBoxConfig config,
    }) => externalDataPath.when(
      data: (path) => SettingsTile.navigation(
        title: const Text("Data Location"),
        description: Text(path.path),
        onPressed: (context) async {
          throw UnimplementedError();

          // final changedPath = await DirPicker.pick();
          // if (changedPath != null && context.mounted) {
          //   final path = changedPath.uri!.path;
          // }
        },
      ),

      error: (_, _) => const CustomSettingsTile(
        child: Center(
          child: Text("Could not get your external data directory"),
        ),
      ),

      loading: () => const CustomSettingsTile(
        child: Center(child: CircularProgressIndicator()),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Local Storage")),
      body: SettingsPageBuilder(
        builder: (context, config) => SettingsList(
          lightTheme: getSettingsThemeData(context),
          darkTheme: getSettingsThemeData(context),
          sections: [
            SettingsSection(
              tiles: [externalDataTile(context: context, config: config)],
            ),
          ],
        ),
      ),
    );
  }
}
