import 'package:flutter/material.dart';

class TextFormDialog extends StatefulWidget {
  final String? initialValue;
  final Widget? title;
  final bool allowEmpty;
  final InputDecoration? decoration;

  const TextFormDialog({
    super.key,
    this.title,
    this.decoration,
    this.initialValue,
    this.allowEmpty = false,
  });

  @override
  State<TextFormDialog> createState() => _TextFormDialogState();
}

class _TextFormDialogState extends State<TextFormDialog> {
  String? textInput;

  @override
  void initState() {
    super.initState();
    textInput = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
      title: widget.title,
      content: TextFormField(
        initialValue: widget.initialValue,
        onChanged: (input) => setState(() {
          if (input.isEmpty) {
            textInput = null;
          } else {
            textInput = input;
          }
        }),

        onFieldSubmitted: (input) => Navigator.of(context).pop(input),
        decoration: widget.decoration,
      ),
      actions: [
        FilledButton.tonal(
          onPressed: textInput == null && !widget.allowEmpty
              ? null
              : () => Navigator.of(context).pop(textInput),
          child: const Text("Submit"),
        ),
        FilledButton.tonal(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
