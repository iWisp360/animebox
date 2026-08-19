import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceDetailsDialog extends ConsumerWidget {
  final AnimeSource source;
  const SourceDetailsDialog({super.key, required this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);

    final detailsTranslations =
        translations.settings.servers.details.animeSources.details;

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
            child: Text(translations.commonActions.done),
          ),
        ],
      ),
    );
  }
}
