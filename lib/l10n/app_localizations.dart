import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @librarySettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Library Settings'**
  String get librarySettingsHeader;

  /// No description provided for @appearanceSettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Appearance Settings'**
  String get appearanceSettingsHeader;

  /// No description provided for @localStorageSettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Local Storage Settings'**
  String get localStorageSettingsHeader;

  /// No description provided for @playbackSettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Playback Settings'**
  String get playbackSettingsHeader;

  /// No description provided for @serversSettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Servers Settings'**
  String get serversSettingsHeader;

  /// No description provided for @advancedSettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Advanced Settings'**
  String get advancedSettingsHeader;

  /// No description provided for @metadataSettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Metadata Settings'**
  String get metadataSettingsHeader;

  /// No description provided for @downloadsSettingsHeader.
  ///
  /// In en, this message translates to:
  /// **'Downloads Settings'**
  String get downloadsSettingsHeader;

  /// No description provided for @librarySettings.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get librarySettings;

  /// No description provided for @appearanceSettings.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceSettings;

  /// No description provided for @localStorageSettings.
  ///
  /// In en, this message translates to:
  /// **'Local Storage'**
  String get localStorageSettings;

  /// No description provided for @playbackSettings.
  ///
  /// In en, this message translates to:
  /// **'Playback'**
  String get playbackSettings;

  /// No description provided for @serversSettings.
  ///
  /// In en, this message translates to:
  /// **'Servers'**
  String get serversSettings;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightMode;

  /// No description provided for @dynamicTheme.
  ///
  /// In en, this message translates to:
  /// **'Dynamic'**
  String get dynamicTheme;

  /// No description provided for @amoledBackground.
  ///
  /// In en, this message translates to:
  /// **'AMOLED Background'**
  String get amoledBackground;

  /// No description provided for @startPage.
  ///
  /// In en, this message translates to:
  /// **'Start Page'**
  String get startPage;

  /// No description provided for @homePage.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homePage;

  /// No description provided for @libraryPage.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get libraryPage;

  /// No description provided for @searchPage.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchPage;

  /// No description provided for @relativeDates.
  ///
  /// In en, this message translates to:
  /// **'Relative Dates'**
  String get relativeDates;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @colorPalette.
  ///
  /// In en, this message translates to:
  /// **'Color Palette'**
  String get colorPalette;

  /// No description provided for @categoriesSection.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesSection;

  /// No description provided for @defaultCategory.
  ///
  /// In en, this message translates to:
  /// **'Default Category'**
  String get defaultCategory;

  /// No description provided for @categoriesListSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No categories added} =1{1 category added} other{{count} categories added}}'**
  String categoriesListSubtitle(num count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
