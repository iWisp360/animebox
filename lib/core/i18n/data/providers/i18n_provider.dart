import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final i18nProvider = FutureProvider<void>((ref) async {
  final config = await ref.watch(configProvider.future);

  await switch (config.appearance.lang) {
    .system => LocaleSettings.useDeviceLocale(),
    .en => LocaleSettings.setLocale(.en),
    .es => LocaleSettings.setLocale(.es),
  };
});
