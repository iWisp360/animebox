import 'package:animebox/core/i18n/context.dart';
import 'package:flutter/material.dart';

class EpisodesFormatHelpDialog extends StatelessWidget {
  const EpisodesFormatHelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.i18n.commonActions.help),
      content: Text(
        context
            .i18n
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
          child: Text(context.i18n.commonActions.ok),
        ),
      ],
    );
  }
}
