import 'package:animebox/core/i18n/context.dart';
import 'package:flutter/material.dart';

class MissingUrlDialog extends StatelessWidget {
  const MissingUrlDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final missingUrlDialogTranslations =
        context.i18n.browsePage.search.results.missingUrlDialog;

    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 500),
      title: Row(
        spacing: 10,
        children: [
          Icon(Icons.link_off, color: Theme.of(context).colorScheme.error),
          Text(missingUrlDialogTranslations.header),
        ],
      ),
      content: Text(missingUrlDialogTranslations.description),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.i18n.commonActions.ok),
        ),
      ],
    );
  }
}
