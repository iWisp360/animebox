import 'package:animebox/core/l10n/localizations/app_localizations.dart';
import 'package:flutter/material.dart';

extension L10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
