// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get librarySettingsHeader => 'Library Settings';

  @override
  String get appearanceSettingsHeader => 'Appearance Settings';

  @override
  String get localStorageSettingsHeader => 'Local Storage Settings';

  @override
  String get playbackSettingsHeader => 'Playback Settings';

  @override
  String get serversSettingsHeader => 'Servers Settings';

  @override
  String get advancedSettingsHeader => 'Advanced Settings';

  @override
  String get metadataSettingsHeader => 'Metadata Settings';

  @override
  String get downloadsSettingsHeader => 'Downloads Settings';

  @override
  String get librarySettings => 'Library';

  @override
  String get appearanceSettings => 'Appearance';

  @override
  String get localStorageSettings => 'Local Storage';

  @override
  String get playbackSettings => 'Playback';

  @override
  String get serversSettings => 'Servers';

  @override
  String get add => 'Add';

  @override
  String get change => 'Change';

  @override
  String get systemMode => 'System';

  @override
  String get darkMode => 'Dark';

  @override
  String get lightMode => 'Light';

  @override
  String get dynamicTheme => 'Dynamic';

  @override
  String get amoledBackground => 'AMOLED Background';

  @override
  String get startPage => 'Start Page';

  @override
  String get homePage => 'Home';

  @override
  String get libraryPage => 'Library';

  @override
  String get searchPage => 'Search';

  @override
  String get relativeDates => 'Relative Dates';

  @override
  String get language => 'Language';

  @override
  String get colorPalette => 'Color Palette';

  @override
  String get categoriesSection => 'Categories';

  @override
  String get defaultCategory => 'Default Category';

  @override
  String categoriesListSubtitle(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categories added',
      one: '1 category added',
      zero: 'No categories added',
    );
    return '$_temp0';
  }
}
