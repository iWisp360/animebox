import 'package:flutter/material.dart';

EdgeInsets calculateDefaultPadding(BuildContext context) {
  if (MediaQuery.of(context).size.width > 810) {
    double padding = (MediaQuery.of(context).size.width - 810) / 2;
    return EdgeInsets.symmetric(horizontal: padding);
  } else {
    return const EdgeInsets.symmetric(vertical: 0);
  }
}
