import 'package:animebox/ui/settings/presentation/views/server_settings/servers_settings_page.dart';
import 'package:flutter/material.dart';

void navigateToServerSettings(BuildContext context) => Navigator.of(
  context,
).push(MaterialPageRoute(builder: (context) => const ServersSettingsPage()));
