import 'package:animebox/ui/widgets/global_info_feedback/providers.dart';
import 'package:animebox/ui/widgets/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageInformation(
      message: "Working on it~",
      customAction: Column(
        mainAxisSize: .min,
        children: [
          FilledButton(
            onPressed: () {
              final notifier = ref.read(globalNotificationController.notifier);

              notifier.toggle(persistent: true);
            },
            child: const Text("The Notifier"),
          ),
          FilledButton(
            onPressed: () {
              final notifier = ref.read(globalNotificationController.notifier);

              notifier.setState(
                message: (i18n) => i18n.commonActions.delete,
                priority: .info,
              );
            },
            child: const Text("Info"),
          ),
          FilledButton(
            onPressed: () {
              final notifier = ref.read(globalNotificationController.notifier);

              notifier.setState(
                message: (i18n) => "Warning",
                priority: .warning,
              );
            },
            child: const Text("Warning"),
          ),
          FilledButton(
            onPressed: () {
              final notifier = ref.read(globalNotificationController.notifier);

              notifier.setState(message: (i18n) => "Error", priority: .error);
            },
            child: const Text("Error"),
          ),
        ],
      ),
      spritesKind: .happySprite,
    );
  }
}
