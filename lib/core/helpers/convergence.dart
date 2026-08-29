import 'dart:io';

import 'package:flutter/material.dart';

bool isDesktopWidth(BuildContext context) {
  if (Platform.isAndroid) {
    return MediaQuery.of(context).orientation == .landscape;
  } else {
    return MediaQuery.of(context).size.width >= 850;
  }
}

// Reused from `settings_ui`
EdgeInsets calculateDefaultPadding(
  BuildContext context, {
  double maxWidth = 810,
}) {
  if (MediaQuery.of(context).size.width > maxWidth) {
    double padding = (MediaQuery.of(context).size.width - maxWidth) / 2;
    return EdgeInsets.symmetric(horizontal: padding);
  } else {
    return const EdgeInsets.symmetric(vertical: 0);
  }
}
