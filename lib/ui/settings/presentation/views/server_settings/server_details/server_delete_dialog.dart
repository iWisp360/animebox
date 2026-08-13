import 'package:animebox/core/i18n/context.dart';
import 'package:flutter/material.dart';

class ServerDeleteDialog extends StatelessWidget {
  const ServerDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final dialogTranslations =
        context.i18n.settings.servers.details.deleteServer.dialog;

    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 400),
      title: Text(dialogTranslations.title),
      content: Text(dialogTranslations.description),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(context.i18n.commonActions.delete),
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.i18n.commonActions.cancel),
        ),
      ],
    );
  }
}
