import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/injector.dart';
import 'package:animebox/ui/settings/presentation/views/settings_ui_theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeBoxAboutPage extends ConsumerWidget {
  const AnimeBoxAboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);

    final aboutPageTranslations = ref.watch(i18nProvider).settings.about;

    return Scaffold(
      appBar: AppBar(title: Text(aboutPageTranslations.title)),
      body: SettingsList(
        lightTheme: getSettingsThemeData(context),
        darkTheme: getSettingsThemeData(context),
        sections: [
          SettingsSection(
            tiles: [
              CustomSettingsTile(
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: .center,
                      children: [Image.asset("assets/placeholder_icon.png")],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Anime Box",
                          style: TextStyle(fontSize: 36, fontWeight: .w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          aboutPageTranslations.version(
                            version: packageInfo.version,
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: .w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomSettingsTile(
                      child: Row(
                        spacing: 16,
                        mainAxisAlignment: .center,
                        children: [
                          IconButton(
                            onPressed: () => (),
                            iconSize: 36,
                            icon: Icon(
                              Icons.telegram_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          IconButton(
                            onPressed: () => (),
                            icon: SizedBox(
                              width: 36,
                              child: SvgPicture.asset(
                                "assets/matrix-icon.svg",
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.primary,
                                  .srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              SettingsTile.navigation(
                title: Text(aboutPageTranslations.sourceCode),
                leading: const Icon(Icons.code_outlined),
                onPressed: (context) async => await launchUrl(
                  Uri.parse("https://codeberg.org/iWisp360/animebox"),
                ),
              ),
              SettingsTile.navigation(
                title: Text(aboutPageTranslations.website),
                leading: const Icon(Icons.public_outlined),
              ),
              SettingsTile.navigation(
                title: Text(aboutPageTranslations.contribute),
                leading: const Icon(Icons.favorite_outlined),
              ),
              SettingsTile.navigation(
                title: Text(aboutPageTranslations.whatsnew),
                leading: const Icon(Icons.new_releases_outlined),
              ),
              SettingsTile.navigation(
                title: Text(aboutPageTranslations.licenses),
                leading: const Icon(Icons.gavel_outlined),
              ),
              SettingsTile.navigation(
                title: Text(aboutPageTranslations.credits),
                leading: const Icon(Icons.group_outlined),
              ),

              SettingsTile.navigation(
                title: Text(aboutPageTranslations.checkForUpdates),
                leading: const Icon(Icons.update_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
