import 'package:animebox/core/configs/domain/entities/downloads.dart';
import 'package:animebox/core/dates/data/repositories/dates_repository_impl.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/features/episodes/data/providers/episodes_format_provider.dart';
import 'package:animebox/features/episodes/domain/entities/episode.dart';
import 'package:animebox/features/episodes/domain/exceptions.dart';
import 'package:animebox/ui/settings/presentation/views/downloads_settings/episodes_format/episodes_format_help_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EpisodesFormatDialog extends ConsumerStatefulWidget {
  final String initialFormat;
  const EpisodesFormatDialog({super.key, required this.initialFormat});

  @override
  ConsumerState<EpisodesFormatDialog> createState() =>
      _EpisodesFormatDialogState();
}

class _EpisodesFormatDialogState extends ConsumerState<EpisodesFormatDialog> {
  String? _errorText;
  String? _renderedFormat;
  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController(text: widget.initialFormat);
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _renderedFormat = ref
            .read(
              episodesFormatProvider((
                context.i18n.downloads.episode,
                const DatesRepositoryImpl(),
              )),
            )
            .renderFormat(
              episode: Episode.test(),
              format: _textController.text,
            );
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final episodesFormatTranslations =
        context.i18n.settings.downloads.downloaderSection.episodesFormat;

    return AlertDialog(
      title: Text(episodesFormatTranslations.title),
      content: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        spacing: 20,
        children: [
          TextFormField(
            controller: _textController,
            decoration: InputDecoration(
              errorText: _errorText,
              helperText: _renderedFormat,
            ),
            onChanged: (format) {
              setState(() {
                try {
                  final rendered = ref
                      .read(
                        episodesFormatProvider((
                          context.i18n.downloads.episode,
                          const DatesRepositoryImpl(),
                        )),
                      )
                      .renderFormat(
                        episode: Episode.test(),
                        format: _textController.text,
                      );

                  _renderedFormat = rendered;
                  _errorText = null;
                } on InvalidFormatException catch (_) {
                  _errorText = episodesFormatTranslations.errorInvalidFormat;
                } on NoNumberFormatException catch (_) {
                  _errorText = episodesFormatTranslations.errorNoNumberFormat;
                }
              });
            },
            onFieldSubmitted: (format) {
              if (_errorText == null) {
                Navigator.of(context).pop(format);
              }
            },
          ),
        ],
      ),
      actionsOverflowButtonSpacing: 10,
      actions: [
        FilledButton.tonal(
          onPressed: () async => await showDialog(
            context: context,
            builder: (context) => const EpisodesFormatHelpDialog(),
          ),
          child: Text(context.i18n.commonActions.help),
        ),
        FilledButton.tonal(
          onPressed: () => Navigator.of(
            context,
          ).pop(const DownloadsConfig().downloadedEpisodesFormat),
          child: Text(context.i18n.commonActions.kDefault),
        ),
        FilledButton(
          onPressed: (_errorText == null)
              ? () => Navigator.of(context).pop(_textController.text)
              : null,
          child: Text(context.i18n.commonActions.done),
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.i18n.commonActions.cancel),
        ),
      ],
    );
  }
}
