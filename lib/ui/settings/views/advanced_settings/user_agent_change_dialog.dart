import 'package:animebox/core/configs/domain/entities/advanced.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAgentChangeDialog extends ConsumerStatefulWidget {
  const UserAgentChangeDialog({super.key});

  @override
  ConsumerState<UserAgentChangeDialog> createState() =>
      _UserAgentChangeDialogState();
}

class _UserAgentChangeDialogState extends ConsumerState<UserAgentChangeDialog> {
  String? _errorText;
  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translations = ref.watch(i18nProvider);
    final userAgentTranslations =
        translations.settings.advanced.networkSection.userAgent;

    return AlertDialog(
      title: Text(userAgentTranslations.title),
      content: TextFormField(
        controller: _textController,
        decoration: InputDecoration(
          label: Text(userAgentTranslations.title),
          errorText: _errorText,
        ),
        onChanged: (userAgent) {
          setState(() {
            if (userAgent.isEmpty) {
              _errorText = userAgentTranslations.emptyError;
            } else {
              _errorText = null;
            }
          });
        },
        onFieldSubmitted: (userAgent) {
          if (userAgent.isNotEmpty) {
            Navigator.of(context).pop(userAgent);
          }
        },
      ),

      actionsOverflowButtonSpacing: 10,
      actions: [
        FilledButton.tonal(
          onPressed: () =>
              Navigator.of(context).pop(const AdvancedConfig().userAgent),
          child: Text(translations.commonActions.kDefault),
        ),
        FilledButton(
          onPressed: (_textController.text.isNotEmpty)
              ? () => Navigator.of(context).pop(_textController.text)
              : null,
          child: Text(translations.commonActions.done),
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(translations.commonActions.cancel),
        ),
      ],
    );
  }
}
