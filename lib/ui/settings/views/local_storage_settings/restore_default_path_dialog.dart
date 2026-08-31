import 'package:animebox/core/files/domain/providers/external_data_directory.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestoreDefaultPathDialog extends ConsumerWidget {
  const RestoreDefaultPathDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);

    return AlertDialog(
      title: const Text("Restore Default Path"),
      constraints: const BoxConstraints(maxWidth: 400),
      content: const Text(
        "Do you want to change the data location back to the app's default?\n\nThis will not move anything from your previous folder, so you may want to use the `Move Data` button.",
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(translations.commonActions.no),
        ),
        FilledButton(
          onPressed: () async {
            await ref
                .read(externalDataDirectoryProvider.notifier)
                .switchToDefaultPath();

            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },

          child: Text(translations.commonActions.yes),
        ),
      ],
    );
  }
}
