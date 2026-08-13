import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:flutter/material.dart';

class SourceDetailsDialog extends StatelessWidget {
  final AnimeSource source;
  const SourceDetailsDialog({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    final detailsTranslations =
        context.i18n.settings.servers.details.animeSources.details;

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: .only(bottom: keyboardHeight),
      child: AlertDialog(
        constraints: const BoxConstraints(minWidth: 300, maxWidth: 400),
        title: SelectableText(source.prettyName),
        content: Column(
          spacing: 5,
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            SelectableText(detailsTranslations.identifier(sourceId: source.id)),
            SelectableText(
              detailsTranslations.recommendations(
                context: (source.recommendations != null) ? .yes : .no,
                recommendations: source.recommendations ?? "",
                gender: .female,
              ),
            ),
            SelectableText(
              detailsTranslations.hentai(
                context: source.isHentaiSource ? .yes : .no,
              ),
            ),
          ],
        ),
        actionsAlignment: .center,
        actions: [
          FilledButton.tonal(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.i18n.commonActions.done),
          ),
        ],
      ),
    );
  }
}
