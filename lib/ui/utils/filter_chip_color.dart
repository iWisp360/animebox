import 'package:animebox/core/configs/domain/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Color filterChipColor(WidgetRef ref, BuildContext context) {
  final animeBoxConfig = ref.watch(configProvider);

  return animeBoxConfig.maybeWhen(
    orElse: () => ColorScheme.of(context).surfaceContainer,
    data: (config) => !config.appearance.pitchBlack
        ? ColorScheme.of(context).surfaceContainer
        : Colors.black,
  );
}
