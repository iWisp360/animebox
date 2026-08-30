import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/configs/domain/entities/config.dart';
import 'package:animebox/ui/utils/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPageBuilder extends ConsumerWidget {
  final Function(BuildContext context, AnimeBoxConfig config) builder;
  const SettingsPageBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeBoxConfig = ref.watch(configProvider);

    return animeBoxConfig.when(
      data: (config) => builder(context, config),
      error: (e, st) =>
          PageInformation(message: e.toString(), spritesKind: .errorSprite),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
