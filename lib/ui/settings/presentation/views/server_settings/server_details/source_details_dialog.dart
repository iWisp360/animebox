import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:flutter/material.dart';

class SourceDetailsDialog extends StatelessWidget {
  final AnimeSource source;
  const SourceDetailsDialog({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
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
            SelectableText("Identifier: ${source.id}"),
            SelectableText(
              "Recommendations: ${source.recommendations ?? "None"}",
            ),
            SelectableText("Hentai: ${source.isHentaiSource ? "Yes" : "No"}"),
          ],
        ),
        actionsAlignment: .center,
        actions: [
          FilledButton.tonal(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }
}
