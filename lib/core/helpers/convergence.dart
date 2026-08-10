import 'package:flutter/material.dart';

bool isDesktopWidth(BuildContext context) =>
    MediaQuery.of(context).size.width >= 900;
