import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/ui/routes.dart';
import 'package:animebox/ui/settings/presentation/views/advanced_settings/user_agent_change_dialog.dart';
import 'package:animebox/ui/settings/presentation/views/page_builder.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AdvancedSettingsPage extends ConsumerWidget {
  const AdvancedSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final advancedSettingsTranslations = ref
        .watch(i18nProvider)
        .settings
        .advanced;

    return PopScope(
      canPop: !ref.watch(dialogOpenProvider),
      child: Scaffold(
        appBar: AppBar(title: Text(advancedSettingsTranslations.title)),
        body: SettingsPageBuilder(
          builder: (context, config) => SettingsList(
            lightTheme: getSettingsThemeData(context),
            darkTheme: getSettingsThemeData(context),
            sections: [
              SettingsSection(
                title: Text(advancedSettingsTranslations.logsSection.title),
                tiles: [
                  SettingsTile.switchTile(
                    initialValue: config.advanced.debugLogs,
                    onToggle: (value) => ref
                        .read(configProvider.notifier)
                        .change(
                          config.copyWith(
                            advanced: config.advanced.copyWith(
                              debugLogs: value,
                            ),
                          ),
                        ),
                    title: Text(
                      advancedSettingsTranslations.logsSection.debugLogs.title,
                    ),
                    description: Text(
                      advancedSettingsTranslations
                          .logsSection
                          .debugLogs
                          .description,
                    ),
                  ),
                ],
              ),

              SettingsSection(
                title: Text(advancedSettingsTranslations.networkSection.title),
                tiles: [
                  SettingsTile.navigation(
                    title: Text(
                      advancedSettingsTranslations
                          .networkSection
                          .userAgent
                          .title,
                    ),
                    value: Text(config.advanced.userAgent),
                    onPressed: (context) async {
                      final newUserAgent = await showDialog(
                        context: context,
                        builder: (context) => const UserAgentChangeDialog(),
                      );

                      if (newUserAgent != null) {
                        await ref
                            .read(configProvider.notifier)
                            .change(
                              config.copyWith(
                                advanced: config.advanced.copyWith(
                                  userAgent: newUserAgent,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
