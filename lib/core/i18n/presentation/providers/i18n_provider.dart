import 'dart:async';

import 'package:animebox/core/configs/domain/providers/config_provider.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceTranslationsProvider = Provider<AppLocale>(
  (ref) => throw UnimplementedError("Provided externally"),
);

final i18nProvider = NotifierProvider(I18nProvider.new);
final i18nNotifier = AsyncNotifierProvider(I18nNotifier.new);

class I18nProvider extends Notifier<Translations> {
  @override
  Translations build() => ref.read(deviceTranslationsProvider).translations;

  void setLang(Translations newTranslations) {
    state = newTranslations;
  }
}

class I18nNotifier extends AsyncNotifier<AppLocale> {
  @override
  FutureOr<AppLocale> build() {
    final config = ref.watch(configProvider);

    return config.when(
      data: (config) => switch (config.appearance.lang) {
        .system => LocaleSettings.useDeviceLocale(),
        .en => LocaleSettings.setLocale(.en),
        .es => LocaleSettings.setLocale(.es),
      },
      error: (_, _) => ref.read(deviceTranslationsProvider),
      loading: () => ref.read(deviceTranslationsProvider),
    );
  }
}
