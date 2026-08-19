import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerDeleteDialog extends ConsumerWidget {
  const ServerDeleteDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);
    final dialogTranslations =
        translations.settings.servers.details.deleteServer.dialog;

    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 400),
      title: Text(dialogTranslations.title),
      content: Text(dialogTranslations.description.trim()),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(translations.commonActions.delete),
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(translations.commonActions.cancel),
        ),
      ],
    );
  }
}
