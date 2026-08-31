import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/presentation/providers/source_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceDisabledDialog extends ConsumerWidget {
  final String serverUuid;
  final AnimeSource source;

  const SourceDisabledDialog({
    super.key,
    required this.serverUuid,
    required this.source,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = ref.watch(i18nProvider);

    return AlertDialog(
      title: Text(source.prettyName),
      content: Text(
        "The source ${source.prettyName} is disabled. Do you want to enable it?\n\nYou can also browse this source without enabling it.",
      ),
      actionsOverflowButtonSpacing: 10,
      actions: [
        FilledButton.tonal(
          onPressed: () =>
              Navigator.of(context).pop<SourceDisabledDialogResponse>(.browse),
          child: const Text("Browse"),
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(translations.commonActions.no),
        ),
        FilledButton(
          onPressed: () async {
            await ref
                .read(sourceManagerProvider.notifier)
                .enableSource(source, serverUuid);

            if (context.mounted) {
              Navigator.of(context).pop<SourceDisabledDialogResponse>(.saidYes);
            }
          },
          child: Text(translations.commonActions.yes),
        ),
      ],
    );
  }
}

enum SourceDisabledDialogResponse { saidYes, browse }
