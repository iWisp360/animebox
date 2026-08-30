import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/core/files/data/providers/external_data_directory_provider.dart';
import 'package:animebox/ui/settings/views/local_storage_settings/restore_default_path_dialog.dart';
import 'package:animebox/ui/settings/views/page_builder.dart';
import 'package:animebox/ui/settings/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:dir_picker/dir_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class LocalStorageSettingsPage extends ConsumerWidget {
  const LocalStorageSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final externalDataPath = ref.watch(externalDataDirectoryProvider);
    final animeBoxConfig = ref.watch(configProvider);

    AbstractSettingsTile externalDataTile({
      required BuildContext context,
      required AnimeBoxConfig config,
    }) => CustomSettingsTile(
      child: Column(
        children: [
          externalDataPath.when(
            data: (path) => SettingsTile.navigation(
              title: const Text("Data Location"),
              description: Text(path.toString()),
              onPressed: (context) async {
                final changedPath = await DirPicker.pick(
                  options: const .android(shouldPersist: true),
                );

                if (changedPath != null && context.mounted) {
                  await ref
                      .read(configProvider.notifier)
                      .change(
                        config.copyWith.localStorage(
                          dataPath: changedPath.uri!,
                        ),
                      );
                }
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
          ),
          // temporary
          FilledButton(
            onPressed: animeBoxConfig.maybeWhen(
              orElse: () => null,
              data: (config) => (config.localStorage.dataPath != null)
                  ? () => showDialog(
                      context: context,
                      builder: (context) => const RestoreDefaultPathDialog(),
                    )
                  : null,
            ),
            child: const Text("Restore Default Path"),
          ),
        ],
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
