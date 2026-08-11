import 'package:animebox/features/settings/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';

void navigateToSettings(BuildContext context) => Navigator.of(
  context,
).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
