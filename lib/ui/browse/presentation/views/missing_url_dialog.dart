import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MissingUrlDialog extends ConsumerWidget {
  const MissingUrlDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);

    final missingUrlDialogTranslations =
        translations.browsePage.search.results.missingUrlDialog;

    return DialogWithNotify(
      child: AlertDialog(
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
            child: Text(translations.commonActions.ok),
          ),
        ],
      ),
    );
  }
}
