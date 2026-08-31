import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EpisodesFormatHelpDialog extends ConsumerWidget {
  const EpisodesFormatHelpDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);

    return AlertDialog(
      title: Text(translations.commonActions.help),
      content: Text(
        translations
            .settings
            .downloads
            .downloaderSection
            .episodesFormat
            .helpText
            .trim(),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(translations.commonActions.ok),
        ),
      ],
    );
  }
}
