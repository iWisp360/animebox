// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryConfig {

 List<String> get customCategories; String? get defaultCategory;
/// Create a copy of LibraryConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryConfigCopyWith<LibraryConfig> get copyWith => _$LibraryConfigCopyWithImpl<LibraryConfig>(this as LibraryConfig, _$identity);

  /// Serializes this LibraryConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryConfig&&const DeepCollectionEquality().equals(other.customCategories, customCategories)&&(identical(other.defaultCategory, defaultCategory) || other.defaultCategory == defaultCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(customCategories),defaultCategory);

@override
String toString() {
  return 'LibraryConfig(customCategories: $customCategories, defaultCategory: $defaultCategory)';
}


}

/// @nodoc
abstract mixin class $LibraryConfigCopyWith<$Res>  {
  factory $LibraryConfigCopyWith(LibraryConfig value, $Res Function(LibraryConfig) _then) = _$LibraryConfigCopyWithImpl;
@useResult
$Res call({
 List<String> customCategories, String? defaultCategory
});




}
/// @nodoc
class _$LibraryConfigCopyWithImpl<$Res>
    implements $LibraryConfigCopyWith<$Res> {
  _$LibraryConfigCopyWithImpl(this._self, this._then);

  final LibraryConfig _self;
  final $Res Function(LibraryConfig) _then;

/// Create a copy of LibraryConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customCategories = null,Object? defaultCategory = freezed,}) {
  return _then(_self.copyWith(
customCategories: null == customCategories ? _self.customCategories : customCategories // ignore: cast_nullable_to_non_nullable
as List<String>,defaultCategory: freezed == defaultCategory ? _self.defaultCategory : defaultCategory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryConfig].
extension LibraryConfigPatterns on LibraryConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryConfig value)  $default,){
final _that = this;
switch (_that) {
case _LibraryConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryConfig value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> customCategories,  String? defaultCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryConfig() when $default != null:
return $default(_that.customCategories,_that.defaultCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> customCategories,  String? defaultCategory)  $default,) {final _that = this;
switch (_that) {
case _LibraryConfig():
return $default(_that.customCategories,_that.defaultCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> customCategories,  String? defaultCategory)?  $default,) {final _that = this;
switch (_that) {
case _LibraryConfig() when $default != null:
return $default(_that.customCategories,_that.defaultCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryConfig implements LibraryConfig {
  const _LibraryConfig({final  List<String> customCategories = const [], this.defaultCategory}): _customCategories = customCategories;
  factory _LibraryConfig.fromJson(Map<String, dynamic> json) => _$LibraryConfigFromJson(json);

 final  List<String> _customCategories;
@override@JsonKey() List<String> get customCategories {
  if (_customCategories is EqualUnmodifiableListView) return _customCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customCategories);
}

@override final  String? defaultCategory;

/// Create a copy of LibraryConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryConfigCopyWith<_LibraryConfig> get copyWith => __$LibraryConfigCopyWithImpl<_LibraryConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryConfig&&const DeepCollectionEquality().equals(other._customCategories, _customCategories)&&(identical(other.defaultCategory, defaultCategory) || other.defaultCategory == defaultCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customCategories),defaultCategory);

@override
String toString() {
  return 'LibraryConfig(customCategories: $customCategories, defaultCategory: $defaultCategory)';
}


}

/// @nodoc
abstract mixin class _$LibraryConfigCopyWith<$Res> implements $LibraryConfigCopyWith<$Res> {
  factory _$LibraryConfigCopyWith(_LibraryConfig value, $Res Function(_LibraryConfig) _then) = __$LibraryConfigCopyWithImpl;
@override @useResult
$Res call({
 List<String> customCategories, String? defaultCategory
});




}
/// @nodoc
class __$LibraryConfigCopyWithImpl<$Res>
    implements _$LibraryConfigCopyWith<$Res> {
  __$LibraryConfigCopyWithImpl(this._self, this._then);

  final _LibraryConfig _self;
  final $Res Function(_LibraryConfig) _then;

/// Create a copy of LibraryConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customCategories = null,Object? defaultCategory = freezed,}) {
  return _then(_LibraryConfig(
customCategories: null == customCategories ? _self._customCategories : customCategories // ignore: cast_nullable_to_non_nullable
as List<String>,defaultCategory: freezed == defaultCategory ? _self.defaultCategory : defaultCategory // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LibraryAutoUpdateConfig {

 bool get enable;/// Interval in hours to update the library automatically
 int get interval; bool get allowMobileData; bool get avoidWatchedSeries; bool get avoidCompletedSeries;
/// Create a copy of LibraryAutoUpdateConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryAutoUpdateConfigCopyWith<LibraryAutoUpdateConfig> get copyWith => _$LibraryAutoUpdateConfigCopyWithImpl<LibraryAutoUpdateConfig>(this as LibraryAutoUpdateConfig, _$identity);

  /// Serializes this LibraryAutoUpdateConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryAutoUpdateConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.allowMobileData, allowMobileData) || other.allowMobileData == allowMobileData)&&(identical(other.avoidWatchedSeries, avoidWatchedSeries) || other.avoidWatchedSeries == avoidWatchedSeries)&&(identical(other.avoidCompletedSeries, avoidCompletedSeries) || other.avoidCompletedSeries == avoidCompletedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,interval,allowMobileData,avoidWatchedSeries,avoidCompletedSeries);

@override
String toString() {
  return 'LibraryAutoUpdateConfig(enable: $enable, interval: $interval, allowMobileData: $allowMobileData, avoidWatchedSeries: $avoidWatchedSeries, avoidCompletedSeries: $avoidCompletedSeries)';
}


}

/// @nodoc
abstract mixin class $LibraryAutoUpdateConfigCopyWith<$Res>  {
  factory $LibraryAutoUpdateConfigCopyWith(LibraryAutoUpdateConfig value, $Res Function(LibraryAutoUpdateConfig) _then) = _$LibraryAutoUpdateConfigCopyWithImpl;
@useResult
$Res call({
 bool enable, int interval, bool allowMobileData, bool avoidWatchedSeries, bool avoidCompletedSeries
});




}
/// @nodoc
class _$LibraryAutoUpdateConfigCopyWithImpl<$Res>
    implements $LibraryAutoUpdateConfigCopyWith<$Res> {
  _$LibraryAutoUpdateConfigCopyWithImpl(this._self, this._then);

  final LibraryAutoUpdateConfig _self;
  final $Res Function(LibraryAutoUpdateConfig) _then;

/// Create a copy of LibraryAutoUpdateConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? interval = null,Object? allowMobileData = null,Object? avoidWatchedSeries = null,Object? avoidCompletedSeries = null,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,allowMobileData: null == allowMobileData ? _self.allowMobileData : allowMobileData // ignore: cast_nullable_to_non_nullable
as bool,avoidWatchedSeries: null == avoidWatchedSeries ? _self.avoidWatchedSeries : avoidWatchedSeries // ignore: cast_nullable_to_non_nullable
as bool,avoidCompletedSeries: null == avoidCompletedSeries ? _self.avoidCompletedSeries : avoidCompletedSeries // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryAutoUpdateConfig].
extension LibraryAutoUpdateConfigPatterns on LibraryAutoUpdateConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryAutoUpdateConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryAutoUpdateConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryAutoUpdateConfig value)  $default,){
final _that = this;
switch (_that) {
case _LibraryAutoUpdateConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryAutoUpdateConfig value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryAutoUpdateConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  int interval,  bool allowMobileData,  bool avoidWatchedSeries,  bool avoidCompletedSeries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryAutoUpdateConfig() when $default != null:
return $default(_that.enable,_that.interval,_that.allowMobileData,_that.avoidWatchedSeries,_that.avoidCompletedSeries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  int interval,  bool allowMobileData,  bool avoidWatchedSeries,  bool avoidCompletedSeries)  $default,) {final _that = this;
switch (_that) {
case _LibraryAutoUpdateConfig():
return $default(_that.enable,_that.interval,_that.allowMobileData,_that.avoidWatchedSeries,_that.avoidCompletedSeries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  int interval,  bool allowMobileData,  bool avoidWatchedSeries,  bool avoidCompletedSeries)?  $default,) {final _that = this;
switch (_that) {
case _LibraryAutoUpdateConfig() when $default != null:
return $default(_that.enable,_that.interval,_that.allowMobileData,_that.avoidWatchedSeries,_that.avoidCompletedSeries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryAutoUpdateConfig implements LibraryAutoUpdateConfig {
  const _LibraryAutoUpdateConfig({this.enable = false, this.interval = 6, this.allowMobileData = false, this.avoidWatchedSeries = true, this.avoidCompletedSeries = true});
  factory _LibraryAutoUpdateConfig.fromJson(Map<String, dynamic> json) => _$LibraryAutoUpdateConfigFromJson(json);

@override@JsonKey() final  bool enable;
/// Interval in hours to update the library automatically
@override@JsonKey() final  int interval;
@override@JsonKey() final  bool allowMobileData;
@override@JsonKey() final  bool avoidWatchedSeries;
@override@JsonKey() final  bool avoidCompletedSeries;

/// Create a copy of LibraryAutoUpdateConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryAutoUpdateConfigCopyWith<_LibraryAutoUpdateConfig> get copyWith => __$LibraryAutoUpdateConfigCopyWithImpl<_LibraryAutoUpdateConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryAutoUpdateConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryAutoUpdateConfig&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.allowMobileData, allowMobileData) || other.allowMobileData == allowMobileData)&&(identical(other.avoidWatchedSeries, avoidWatchedSeries) || other.avoidWatchedSeries == avoidWatchedSeries)&&(identical(other.avoidCompletedSeries, avoidCompletedSeries) || other.avoidCompletedSeries == avoidCompletedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,interval,allowMobileData,avoidWatchedSeries,avoidCompletedSeries);

@override
String toString() {
  return 'LibraryAutoUpdateConfig(enable: $enable, interval: $interval, allowMobileData: $allowMobileData, avoidWatchedSeries: $avoidWatchedSeries, avoidCompletedSeries: $avoidCompletedSeries)';
}


}

/// @nodoc
abstract mixin class _$LibraryAutoUpdateConfigCopyWith<$Res> implements $LibraryAutoUpdateConfigCopyWith<$Res> {
  factory _$LibraryAutoUpdateConfigCopyWith(_LibraryAutoUpdateConfig value, $Res Function(_LibraryAutoUpdateConfig) _then) = __$LibraryAutoUpdateConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enable, int interval, bool allowMobileData, bool avoidWatchedSeries, bool avoidCompletedSeries
});




}
/// @nodoc
class __$LibraryAutoUpdateConfigCopyWithImpl<$Res>
    implements _$LibraryAutoUpdateConfigCopyWith<$Res> {
  __$LibraryAutoUpdateConfigCopyWithImpl(this._self, this._then);

  final _LibraryAutoUpdateConfig _self;
  final $Res Function(_LibraryAutoUpdateConfig) _then;

/// Create a copy of LibraryAutoUpdateConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? interval = null,Object? allowMobileData = null,Object? avoidWatchedSeries = null,Object? avoidCompletedSeries = null,}) {
  return _then(_LibraryAutoUpdateConfig(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,allowMobileData: null == allowMobileData ? _self.allowMobileData : allowMobileData // ignore: cast_nullable_to_non_nullable
as bool,avoidWatchedSeries: null == avoidWatchedSeries ? _self.avoidWatchedSeries : avoidWatchedSeries // ignore: cast_nullable_to_non_nullable
as bool,avoidCompletedSeries: null == avoidCompletedSeries ? _self.avoidCompletedSeries : avoidCompletedSeries // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
