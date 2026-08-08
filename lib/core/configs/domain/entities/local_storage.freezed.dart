// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_storage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalStorageConfig {

 String get dataPath; bool get deleteWatchedEpisodes; bool get automaticBackups;/// Interval of backups in hours when `automaticBackups` is `true`
 int get backupsInterval;
/// Create a copy of LocalStorageConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalStorageConfigCopyWith<LocalStorageConfig> get copyWith => _$LocalStorageConfigCopyWithImpl<LocalStorageConfig>(this as LocalStorageConfig, _$identity);

  /// Serializes this LocalStorageConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalStorageConfig&&(identical(other.dataPath, dataPath) || other.dataPath == dataPath)&&(identical(other.deleteWatchedEpisodes, deleteWatchedEpisodes) || other.deleteWatchedEpisodes == deleteWatchedEpisodes)&&(identical(other.automaticBackups, automaticBackups) || other.automaticBackups == automaticBackups)&&(identical(other.backupsInterval, backupsInterval) || other.backupsInterval == backupsInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataPath,deleteWatchedEpisodes,automaticBackups,backupsInterval);

@override
String toString() {
  return 'LocalStorageConfig(dataPath: $dataPath, deleteWatchedEpisodes: $deleteWatchedEpisodes, automaticBackups: $automaticBackups, backupsInterval: $backupsInterval)';
}


}

/// @nodoc
abstract mixin class $LocalStorageConfigCopyWith<$Res>  {
  factory $LocalStorageConfigCopyWith(LocalStorageConfig value, $Res Function(LocalStorageConfig) _then) = _$LocalStorageConfigCopyWithImpl;
@useResult
$Res call({
 String dataPath, bool deleteWatchedEpisodes, bool automaticBackups, int backupsInterval
});




}
/// @nodoc
class _$LocalStorageConfigCopyWithImpl<$Res>
    implements $LocalStorageConfigCopyWith<$Res> {
  _$LocalStorageConfigCopyWithImpl(this._self, this._then);

  final LocalStorageConfig _self;
  final $Res Function(LocalStorageConfig) _then;

/// Create a copy of LocalStorageConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataPath = null,Object? deleteWatchedEpisodes = null,Object? automaticBackups = null,Object? backupsInterval = null,}) {
  return _then(_self.copyWith(
dataPath: null == dataPath ? _self.dataPath : dataPath // ignore: cast_nullable_to_non_nullable
as String,deleteWatchedEpisodes: null == deleteWatchedEpisodes ? _self.deleteWatchedEpisodes : deleteWatchedEpisodes // ignore: cast_nullable_to_non_nullable
as bool,automaticBackups: null == automaticBackups ? _self.automaticBackups : automaticBackups // ignore: cast_nullable_to_non_nullable
as bool,backupsInterval: null == backupsInterval ? _self.backupsInterval : backupsInterval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalStorageConfig].
extension LocalStorageConfigPatterns on LocalStorageConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalStorageConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalStorageConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalStorageConfig value)  $default,){
final _that = this;
switch (_that) {
case _LocalStorageConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalStorageConfig value)?  $default,){
final _that = this;
switch (_that) {
case _LocalStorageConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dataPath,  bool deleteWatchedEpisodes,  bool automaticBackups,  int backupsInterval)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalStorageConfig() when $default != null:
return $default(_that.dataPath,_that.deleteWatchedEpisodes,_that.automaticBackups,_that.backupsInterval);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dataPath,  bool deleteWatchedEpisodes,  bool automaticBackups,  int backupsInterval)  $default,) {final _that = this;
switch (_that) {
case _LocalStorageConfig():
return $default(_that.dataPath,_that.deleteWatchedEpisodes,_that.automaticBackups,_that.backupsInterval);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dataPath,  bool deleteWatchedEpisodes,  bool automaticBackups,  int backupsInterval)?  $default,) {final _that = this;
switch (_that) {
case _LocalStorageConfig() when $default != null:
return $default(_that.dataPath,_that.deleteWatchedEpisodes,_that.automaticBackups,_that.backupsInterval);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalStorageConfig implements LocalStorageConfig {
  const _LocalStorageConfig({this.dataPath = "%d/AnimeBox", this.deleteWatchedEpisodes = false, this.automaticBackups = false, this.backupsInterval = 3});
  factory _LocalStorageConfig.fromJson(Map<String, dynamic> json) => _$LocalStorageConfigFromJson(json);

@override@JsonKey() final  String dataPath;
@override@JsonKey() final  bool deleteWatchedEpisodes;
@override@JsonKey() final  bool automaticBackups;
/// Interval of backups in hours when `automaticBackups` is `true`
@override@JsonKey() final  int backupsInterval;

/// Create a copy of LocalStorageConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalStorageConfigCopyWith<_LocalStorageConfig> get copyWith => __$LocalStorageConfigCopyWithImpl<_LocalStorageConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalStorageConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalStorageConfig&&(identical(other.dataPath, dataPath) || other.dataPath == dataPath)&&(identical(other.deleteWatchedEpisodes, deleteWatchedEpisodes) || other.deleteWatchedEpisodes == deleteWatchedEpisodes)&&(identical(other.automaticBackups, automaticBackups) || other.automaticBackups == automaticBackups)&&(identical(other.backupsInterval, backupsInterval) || other.backupsInterval == backupsInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataPath,deleteWatchedEpisodes,automaticBackups,backupsInterval);

@override
String toString() {
  return 'LocalStorageConfig(dataPath: $dataPath, deleteWatchedEpisodes: $deleteWatchedEpisodes, automaticBackups: $automaticBackups, backupsInterval: $backupsInterval)';
}


}

/// @nodoc
abstract mixin class _$LocalStorageConfigCopyWith<$Res> implements $LocalStorageConfigCopyWith<$Res> {
  factory _$LocalStorageConfigCopyWith(_LocalStorageConfig value, $Res Function(_LocalStorageConfig) _then) = __$LocalStorageConfigCopyWithImpl;
@override @useResult
$Res call({
 String dataPath, bool deleteWatchedEpisodes, bool automaticBackups, int backupsInterval
});




}
/// @nodoc
class __$LocalStorageConfigCopyWithImpl<$Res>
    implements _$LocalStorageConfigCopyWith<$Res> {
  __$LocalStorageConfigCopyWithImpl(this._self, this._then);

  final _LocalStorageConfig _self;
  final $Res Function(_LocalStorageConfig) _then;

/// Create a copy of LocalStorageConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataPath = null,Object? deleteWatchedEpisodes = null,Object? automaticBackups = null,Object? backupsInterval = null,}) {
  return _then(_LocalStorageConfig(
dataPath: null == dataPath ? _self.dataPath : dataPath // ignore: cast_nullable_to_non_nullable
as String,deleteWatchedEpisodes: null == deleteWatchedEpisodes ? _self.deleteWatchedEpisodes : deleteWatchedEpisodes // ignore: cast_nullable_to_non_nullable
as bool,automaticBackups: null == automaticBackups ? _self.automaticBackups : automaticBackups // ignore: cast_nullable_to_non_nullable
as bool,backupsInterval: null == backupsInterval ? _self.backupsInterval : backupsInterval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
