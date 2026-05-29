import 'package:animebox/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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

final readableIntervalsMenu = [
  DropdownMenuItem(value: 1, child: Text(readableIntervals(1))),
  DropdownMenuItem(value: 3, child: Text(readableIntervals(3))),
  DropdownMenuItem(value: 6, child: Text(readableIntervals(6))),
  DropdownMenuItem(value: 12, child: Text(readableIntervals(12))),
  DropdownMenuItem(value: 24, child: Text(readableIntervals(24))),
  DropdownMenuItem(value: 48, child: Text(readableIntervals(48))),
  DropdownMenuItem(value: 168, child: Text(readableIntervals(168))),
  DropdownMenuItem(value: 336, child: Text(readableIntervals(336))),
];
