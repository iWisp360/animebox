import 'dart:io';

import 'package:flutter/material.dart';

bool isDesktopWidth(BuildContext context) {
  if (Platform.isAndroid) {
    return MediaQuery.of(context).orientation == .landscape;
  } else {
    return MediaQuery.of(context).size.width >= 850;
  }
}
