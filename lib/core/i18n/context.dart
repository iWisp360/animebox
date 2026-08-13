import 'package:animebox/gen/strings.g.dart';
import 'package:flutter/material.dart';

extension I18n on BuildContext {
  Translations get i18n => Translations.of(this);
}
