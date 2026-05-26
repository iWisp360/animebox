import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

Function(BuildContext) globalKeyListener(GlobalKey globalKey) => (context) {
  GestureDetector? detector;
  void findGestureDetector(Element element) {
    if (element.widget is GestureDetector) {
      detector = element.widget as GestureDetector;
      return;
    }
    element.visitChildren(findGestureDetector);
  }

  final dropdownElement = globalKey.currentContext as Element?;

  dropdownElement?.visitChildren(findGestureDetector);
  detector?.onTap?.call();
};

class ClickableDropdownMenu extends StatefulWidget {
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  final dynamic value;
  final Widget title;
  final bool enabled;
  final Widget? description;
  const ClickableDropdownMenu({
    super.key,
    required this.items,
    required this.onChanged,
    required this.title,
    this.description,
    this.enabled = true,
    this.value,
  });

  @override
  State<ClickableDropdownMenu> createState() => _ClickableDropdownMenuState();
}

class _ClickableDropdownMenuState extends State<ClickableDropdownMenu> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      enabled: widget.enabled,
      onPressed: globalKeyListener(_globalKey),
      title: widget.title,
      description: widget.description,
      trailing: DropdownButton(
        key: _globalKey,
        value: widget.value,
        items: widget.items,
        onChanged: widget.onChanged,
      ),
    );
  }
}

String readableIntervals(int hours) {
  if (hours < 1) {
    return "Every ${(hours * 60).round()} minutes";
  } else if (hours >= 1 && hours < 2) {
    return "Once an hour";
  } else if (hours < 24) {
    return "Every ${hours.round()} hours";
  } else if (hours >= 24 && hours < 48) {
    return "Once a day";
  } else if (hours < 168) {
    return "Every ${(hours / 24).round()} days";
  } else if (hours >= 168 && hours < 336) {
    return "Once a week";
  } else {
    return "Every ${(hours / 168).round()} weeks";
  }
}

final List<DropdownMenuItem> readableIntervalsMenu = [
  DropdownMenuItem(value: 1, child: Text(readableIntervals(1))),
  DropdownMenuItem(value: 3, child: Text(readableIntervals(3))),
  DropdownMenuItem(value: 6, child: Text(readableIntervals(6))),
  DropdownMenuItem(value: 12, child: Text(readableIntervals(12))),
  DropdownMenuItem(value: 24, child: Text(readableIntervals(24))),
  DropdownMenuItem(value: 48, child: Text(readableIntervals(48))),
  DropdownMenuItem(value: 168, child: Text(readableIntervals(168))),
  DropdownMenuItem(value: 336, child: Text(readableIntervals(336))),
];

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
