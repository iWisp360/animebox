import 'package:animebox/core/configs/domain/entities/advanced.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:flutter/material.dart';

class UserAgentChangeDialog extends StatefulWidget {
  const UserAgentChangeDialog({super.key});

  @override
  State<UserAgentChangeDialog> createState() => _UserAgentChangeDialogState();
}

class _UserAgentChangeDialogState extends State<UserAgentChangeDialog> {
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
    final userAgentTranslations =
        context.i18n.settings.advanced.networkSection.userAgent;

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
          child: Text(context.i18n.commonActions.kDefault),
        ),
        FilledButton(
          onPressed: (_textController.text.isNotEmpty)
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
