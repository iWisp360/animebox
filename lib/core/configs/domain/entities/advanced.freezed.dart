// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advanced.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdvancedConfig {

 bool get debugLogs; String get userAgent;
/// Create a copy of AdvancedConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdvancedConfigCopyWith<AdvancedConfig> get copyWith => _$AdvancedConfigCopyWithImpl<AdvancedConfig>(this as AdvancedConfig, _$identity);

  /// Serializes this AdvancedConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdvancedConfig&&(identical(other.debugLogs, debugLogs) || other.debugLogs == debugLogs)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debugLogs,userAgent);

@override
String toString() {
  return 'AdvancedConfig(debugLogs: $debugLogs, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class $AdvancedConfigCopyWith<$Res>  {
  factory $AdvancedConfigCopyWith(AdvancedConfig value, $Res Function(AdvancedConfig) _then) = _$AdvancedConfigCopyWithImpl;
@useResult
$Res call({
 bool debugLogs, String userAgent
});




}
/// @nodoc
class _$AdvancedConfigCopyWithImpl<$Res>
    implements $AdvancedConfigCopyWith<$Res> {
  _$AdvancedConfigCopyWithImpl(this._self, this._then);

  final AdvancedConfig _self;
  final $Res Function(AdvancedConfig) _then;

/// Create a copy of AdvancedConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debugLogs = null,Object? userAgent = null,}) {
  return _then(_self.copyWith(
debugLogs: null == debugLogs ? _self.debugLogs : debugLogs // ignore: cast_nullable_to_non_nullable
as bool,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdvancedConfig].
extension AdvancedConfigPatterns on AdvancedConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdvancedConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdvancedConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdvancedConfig value)  $default,){
final _that = this;
switch (_that) {
case _AdvancedConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdvancedConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AdvancedConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool debugLogs,  String userAgent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdvancedConfig() when $default != null:
return $default(_that.debugLogs,_that.userAgent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool debugLogs,  String userAgent)  $default,) {final _that = this;
switch (_that) {
case _AdvancedConfig():
return $default(_that.debugLogs,_that.userAgent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool debugLogs,  String userAgent)?  $default,) {final _that = this;
switch (_that) {
case _AdvancedConfig() when $default != null:
return $default(_that.debugLogs,_that.userAgent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdvancedConfig implements AdvancedConfig {
  const _AdvancedConfig({this.debugLogs = false, this.userAgent = "Mozilla/5.0 (X11; Linux x86_64; rv:150.0) Gecko/20100101 Firefox/150.0"});
  factory _AdvancedConfig.fromJson(Map<String, dynamic> json) => _$AdvancedConfigFromJson(json);

@override@JsonKey() final  bool debugLogs;
@override@JsonKey() final  String userAgent;

/// Create a copy of AdvancedConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdvancedConfigCopyWith<_AdvancedConfig> get copyWith => __$AdvancedConfigCopyWithImpl<_AdvancedConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdvancedConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdvancedConfig&&(identical(other.debugLogs, debugLogs) || other.debugLogs == debugLogs)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debugLogs,userAgent);

@override
String toString() {
  return 'AdvancedConfig(debugLogs: $debugLogs, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class _$AdvancedConfigCopyWith<$Res> implements $AdvancedConfigCopyWith<$Res> {
  factory _$AdvancedConfigCopyWith(_AdvancedConfig value, $Res Function(_AdvancedConfig) _then) = __$AdvancedConfigCopyWithImpl;
@override @useResult
$Res call({
 bool debugLogs, String userAgent
});




}
/// @nodoc
class __$AdvancedConfigCopyWithImpl<$Res>
    implements _$AdvancedConfigCopyWith<$Res> {
  __$AdvancedConfigCopyWithImpl(this._self, this._then);

  final _AdvancedConfig _self;
  final $Res Function(_AdvancedConfig) _then;

/// Create a copy of AdvancedConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugLogs = null,Object? userAgent = null,}) {
  return _then(_AdvancedConfig(
debugLogs: null == debugLogs ? _self.debugLogs : debugLogs // ignore: cast_nullable_to_non_nullable
as bool,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
