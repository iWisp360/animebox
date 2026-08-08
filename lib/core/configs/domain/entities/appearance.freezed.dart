// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appearance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppearanceConfig {

 Language get lang; HomeScreenTab get defaultHomeScreenTab; ThemeMode get themeMode; AppColorPalette get colorPalette; bool get relativeDates; bool get pitchBlack;
/// Create a copy of AppearanceConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppearanceConfigCopyWith<AppearanceConfig> get copyWith => _$AppearanceConfigCopyWithImpl<AppearanceConfig>(this as AppearanceConfig, _$identity);

  /// Serializes this AppearanceConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppearanceConfig&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.defaultHomeScreenTab, defaultHomeScreenTab) || other.defaultHomeScreenTab == defaultHomeScreenTab)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.colorPalette, colorPalette) || other.colorPalette == colorPalette)&&(identical(other.relativeDates, relativeDates) || other.relativeDates == relativeDates)&&(identical(other.pitchBlack, pitchBlack) || other.pitchBlack == pitchBlack));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lang,defaultHomeScreenTab,themeMode,colorPalette,relativeDates,pitchBlack);

@override
String toString() {
  return 'AppearanceConfig(lang: $lang, defaultHomeScreenTab: $defaultHomeScreenTab, themeMode: $themeMode, colorPalette: $colorPalette, relativeDates: $relativeDates, pitchBlack: $pitchBlack)';
}


}

/// @nodoc
abstract mixin class $AppearanceConfigCopyWith<$Res>  {
  factory $AppearanceConfigCopyWith(AppearanceConfig value, $Res Function(AppearanceConfig) _then) = _$AppearanceConfigCopyWithImpl;
@useResult
$Res call({
 Language lang, HomeScreenTab defaultHomeScreenTab, ThemeMode themeMode, AppColorPalette colorPalette, bool relativeDates, bool pitchBlack
});




}
/// @nodoc
class _$AppearanceConfigCopyWithImpl<$Res>
    implements $AppearanceConfigCopyWith<$Res> {
  _$AppearanceConfigCopyWithImpl(this._self, this._then);

  final AppearanceConfig _self;
  final $Res Function(AppearanceConfig) _then;

/// Create a copy of AppearanceConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lang = null,Object? defaultHomeScreenTab = null,Object? themeMode = null,Object? colorPalette = null,Object? relativeDates = null,Object? pitchBlack = null,}) {
  return _then(_self.copyWith(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as Language,defaultHomeScreenTab: null == defaultHomeScreenTab ? _self.defaultHomeScreenTab : defaultHomeScreenTab // ignore: cast_nullable_to_non_nullable
as HomeScreenTab,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,colorPalette: null == colorPalette ? _self.colorPalette : colorPalette // ignore: cast_nullable_to_non_nullable
as AppColorPalette,relativeDates: null == relativeDates ? _self.relativeDates : relativeDates // ignore: cast_nullable_to_non_nullable
as bool,pitchBlack: null == pitchBlack ? _self.pitchBlack : pitchBlack // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppearanceConfig].
extension AppearanceConfigPatterns on AppearanceConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppearanceConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppearanceConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppearanceConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppearanceConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppearanceConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppearanceConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Language lang,  HomeScreenTab defaultHomeScreenTab,  ThemeMode themeMode,  AppColorPalette colorPalette,  bool relativeDates,  bool pitchBlack)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppearanceConfig() when $default != null:
return $default(_that.lang,_that.defaultHomeScreenTab,_that.themeMode,_that.colorPalette,_that.relativeDates,_that.pitchBlack);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Language lang,  HomeScreenTab defaultHomeScreenTab,  ThemeMode themeMode,  AppColorPalette colorPalette,  bool relativeDates,  bool pitchBlack)  $default,) {final _that = this;
switch (_that) {
case _AppearanceConfig():
return $default(_that.lang,_that.defaultHomeScreenTab,_that.themeMode,_that.colorPalette,_that.relativeDates,_that.pitchBlack);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Language lang,  HomeScreenTab defaultHomeScreenTab,  ThemeMode themeMode,  AppColorPalette colorPalette,  bool relativeDates,  bool pitchBlack)?  $default,) {final _that = this;
switch (_that) {
case _AppearanceConfig() when $default != null:
return $default(_that.lang,_that.defaultHomeScreenTab,_that.themeMode,_that.colorPalette,_that.relativeDates,_that.pitchBlack);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppearanceConfig implements AppearanceConfig {
  const _AppearanceConfig({this.lang = Language.en, this.defaultHomeScreenTab = HomeScreenTab.home, this.themeMode = ThemeMode.system, this.colorPalette = AppColorPalette.dynamic, this.relativeDates = true, this.pitchBlack = false});
  factory _AppearanceConfig.fromJson(Map<String, dynamic> json) => _$AppearanceConfigFromJson(json);

@override@JsonKey() final  Language lang;
@override@JsonKey() final  HomeScreenTab defaultHomeScreenTab;
@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  AppColorPalette colorPalette;
@override@JsonKey() final  bool relativeDates;
@override@JsonKey() final  bool pitchBlack;

/// Create a copy of AppearanceConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppearanceConfigCopyWith<_AppearanceConfig> get copyWith => __$AppearanceConfigCopyWithImpl<_AppearanceConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppearanceConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppearanceConfig&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.defaultHomeScreenTab, defaultHomeScreenTab) || other.defaultHomeScreenTab == defaultHomeScreenTab)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.colorPalette, colorPalette) || other.colorPalette == colorPalette)&&(identical(other.relativeDates, relativeDates) || other.relativeDates == relativeDates)&&(identical(other.pitchBlack, pitchBlack) || other.pitchBlack == pitchBlack));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lang,defaultHomeScreenTab,themeMode,colorPalette,relativeDates,pitchBlack);

@override
String toString() {
  return 'AppearanceConfig(lang: $lang, defaultHomeScreenTab: $defaultHomeScreenTab, themeMode: $themeMode, colorPalette: $colorPalette, relativeDates: $relativeDates, pitchBlack: $pitchBlack)';
}


}

/// @nodoc
abstract mixin class _$AppearanceConfigCopyWith<$Res> implements $AppearanceConfigCopyWith<$Res> {
  factory _$AppearanceConfigCopyWith(_AppearanceConfig value, $Res Function(_AppearanceConfig) _then) = __$AppearanceConfigCopyWithImpl;
@override @useResult
$Res call({
 Language lang, HomeScreenTab defaultHomeScreenTab, ThemeMode themeMode, AppColorPalette colorPalette, bool relativeDates, bool pitchBlack
});




}
/// @nodoc
class __$AppearanceConfigCopyWithImpl<$Res>
    implements _$AppearanceConfigCopyWith<$Res> {
  __$AppearanceConfigCopyWithImpl(this._self, this._then);

  final _AppearanceConfig _self;
  final $Res Function(_AppearanceConfig) _then;

/// Create a copy of AppearanceConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lang = null,Object? defaultHomeScreenTab = null,Object? themeMode = null,Object? colorPalette = null,Object? relativeDates = null,Object? pitchBlack = null,}) {
  return _then(_AppearanceConfig(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as Language,defaultHomeScreenTab: null == defaultHomeScreenTab ? _self.defaultHomeScreenTab : defaultHomeScreenTab // ignore: cast_nullable_to_non_nullable
as HomeScreenTab,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,colorPalette: null == colorPalette ? _self.colorPalette : colorPalette // ignore: cast_nullable_to_non_nullable
as AppColorPalette,relativeDates: null == relativeDates ? _self.relativeDates : relativeDates // ignore: cast_nullable_to_non_nullable
as bool,pitchBlack: null == pitchBlack ? _self.pitchBlack : pitchBlack // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
