import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/ui/routes.dart';
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

    return DialogWithNotify(
      child: AlertDialog(
        title: Text(source.prettyName),
        content: Text(
          "The source ${source.prettyName} is disabled.\nDo you want to enable it?",
        ),
        actions: [
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
                Navigator.of(context).pop(true);
              }
            },
            child: Text(translations.commonActions.yes),
          ),
        ],
      ),
    );
  }
}
