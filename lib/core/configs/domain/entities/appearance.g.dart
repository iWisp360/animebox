// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppearanceConfig _$AppearanceConfigFromJson(Map<String, dynamic> json) =>
    _AppearanceConfig(
      lang: $enumDecodeNullable(_$LanguageEnumMap, json['lang']) ?? Language.en,
      defaultHomeScreenTab:
          $enumDecodeNullable(
            _$HomeScreenTabEnumMap,
            json['defaultHomeScreenTab'],
          ) ??
          HomeScreenTab.home,
      themeMode:
          $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      colorPalette:
          $enumDecodeNullable(_$AppColorPaletteEnumMap, json['colorPalette']) ??
          AppColorPalette.dynamic,
      relativeDates: json['relativeDates'] as bool? ?? true,
      pitchBlack: json['pitchBlack'] as bool? ?? false,
    );

Map<String, dynamic> _$AppearanceConfigToJson(_AppearanceConfig instance) =>
    <String, dynamic>{
      'lang': _$LanguageEnumMap[instance.lang]!,
      'defaultHomeScreenTab':
          _$HomeScreenTabEnumMap[instance.defaultHomeScreenTab]!,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'colorPalette': _$AppColorPaletteEnumMap[instance.colorPalette]!,
      'relativeDates': instance.relativeDates,
      'pitchBlack': instance.pitchBlack,
    };

const _$LanguageEnumMap = {Language.en: 'en', Language.es: 'es'};

const _$HomeScreenTabEnumMap = {
  HomeScreenTab.home: 'home',
  HomeScreenTab.library: 'library',
  HomeScreenTab.trackers: 'trackers',
  HomeScreenTab.search: 'search',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$AppColorPaletteEnumMap = {
  AppColorPalette.dynamic: 'dynamic',
  AppColorPalette.catppuccinLatte: 'catppuccinLatte',
  AppColorPalette.catppuccinFrappe: 'catppuccinFrappe',
  AppColorPalette.catppuccinMacchiato: 'catppuccinMacchiato',
  AppColorPalette.catppuccinMocha: 'catppuccinMocha',
  AppColorPalette.nord: 'nord',
  AppColorPalette.tokyoNight: 'tokyoNight',
  AppColorPalette.matrix: 'matrix',
  AppColorPalette.monochrome: 'monochrome',
};
