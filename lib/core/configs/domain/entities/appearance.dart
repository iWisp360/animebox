import 'package:animebox/core/i18n/domain/entities/language.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appearance.g.dart';
part 'appearance.freezed.dart';

@freezed
abstract class AppearanceConfig with _$AppearanceConfig {
  const factory AppearanceConfig({
    @Default(Language.system) Language lang,
    @Default(HomeScreenTab.home) HomeScreenTab defaultHomeScreenTab,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool relativeDates,
    @Default(false) bool pitchBlack,
  }) = _AppearanceConfig;

  factory AppearanceConfig.fromJson(Map<String, dynamic> json) =>
      _$AppearanceConfigFromJson(json);
}

enum HomeScreenTab { home, library, trackers, search }
