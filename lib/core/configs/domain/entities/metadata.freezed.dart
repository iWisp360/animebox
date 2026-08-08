// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetadataConfig {

 List<MetadataSourceConfig> get sourcePreferences;
/// Create a copy of MetadataConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataConfigCopyWith<MetadataConfig> get copyWith => _$MetadataConfigCopyWithImpl<MetadataConfig>(this as MetadataConfig, _$identity);

  /// Serializes this MetadataConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataConfig&&const DeepCollectionEquality().equals(other.sourcePreferences, sourcePreferences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sourcePreferences));

@override
String toString() {
  return 'MetadataConfig(sourcePreferences: $sourcePreferences)';
}


}

/// @nodoc
abstract mixin class $MetadataConfigCopyWith<$Res>  {
  factory $MetadataConfigCopyWith(MetadataConfig value, $Res Function(MetadataConfig) _then) = _$MetadataConfigCopyWithImpl;
@useResult
$Res call({
 List<MetadataSourceConfig> sourcePreferences
});




}
/// @nodoc
class _$MetadataConfigCopyWithImpl<$Res>
    implements $MetadataConfigCopyWith<$Res> {
  _$MetadataConfigCopyWithImpl(this._self, this._then);

  final MetadataConfig _self;
  final $Res Function(MetadataConfig) _then;

/// Create a copy of MetadataConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourcePreferences = null,}) {
  return _then(_self.copyWith(
sourcePreferences: null == sourcePreferences ? _self.sourcePreferences : sourcePreferences // ignore: cast_nullable_to_non_nullable
as List<MetadataSourceConfig>,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataConfig].
extension MetadataConfigPatterns on MetadataConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataConfig value)  $default,){
final _that = this;
switch (_that) {
case _MetadataConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataConfig value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MetadataSourceConfig> sourcePreferences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataConfig() when $default != null:
return $default(_that.sourcePreferences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MetadataSourceConfig> sourcePreferences)  $default,) {final _that = this;
switch (_that) {
case _MetadataConfig():
return $default(_that.sourcePreferences);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MetadataSourceConfig> sourcePreferences)?  $default,) {final _that = this;
switch (_that) {
case _MetadataConfig() when $default != null:
return $default(_that.sourcePreferences);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetadataConfig implements MetadataConfig {
  const _MetadataConfig({final  List<MetadataSourceConfig> sourcePreferences = const [MetadataSourceConfig(source: .myAnimeList), MetadataSourceConfig(source: .aniList)]}): _sourcePreferences = sourcePreferences;
  factory _MetadataConfig.fromJson(Map<String, dynamic> json) => _$MetadataConfigFromJson(json);

 final  List<MetadataSourceConfig> _sourcePreferences;
@override@JsonKey() List<MetadataSourceConfig> get sourcePreferences {
  if (_sourcePreferences is EqualUnmodifiableListView) return _sourcePreferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sourcePreferences);
}


/// Create a copy of MetadataConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataConfigCopyWith<_MetadataConfig> get copyWith => __$MetadataConfigCopyWithImpl<_MetadataConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataConfig&&const DeepCollectionEquality().equals(other._sourcePreferences, _sourcePreferences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sourcePreferences));

@override
String toString() {
  return 'MetadataConfig(sourcePreferences: $sourcePreferences)';
}


}

/// @nodoc
abstract mixin class _$MetadataConfigCopyWith<$Res> implements $MetadataConfigCopyWith<$Res> {
  factory _$MetadataConfigCopyWith(_MetadataConfig value, $Res Function(_MetadataConfig) _then) = __$MetadataConfigCopyWithImpl;
@override @useResult
$Res call({
 List<MetadataSourceConfig> sourcePreferences
});




}
/// @nodoc
class __$MetadataConfigCopyWithImpl<$Res>
    implements _$MetadataConfigCopyWith<$Res> {
  __$MetadataConfigCopyWithImpl(this._self, this._then);

  final _MetadataConfig _self;
  final $Res Function(_MetadataConfig) _then;

/// Create a copy of MetadataConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourcePreferences = null,}) {
  return _then(_MetadataConfig(
sourcePreferences: null == sourcePreferences ? _self._sourcePreferences : sourcePreferences // ignore: cast_nullable_to_non_nullable
as List<MetadataSourceConfig>,
  ));
}


}


/// @nodoc
mixin _$MetadataSourceConfig {

 bool get enabled; MetadataSource get source;
/// Create a copy of MetadataSourceConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataSourceConfigCopyWith<MetadataSourceConfig> get copyWith => _$MetadataSourceConfigCopyWithImpl<MetadataSourceConfig>(this as MetadataSourceConfig, _$identity);

  /// Serializes this MetadataSourceConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataSourceConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,source);

@override
String toString() {
  return 'MetadataSourceConfig(enabled: $enabled, source: $source)';
}


}

/// @nodoc
abstract mixin class $MetadataSourceConfigCopyWith<$Res>  {
  factory $MetadataSourceConfigCopyWith(MetadataSourceConfig value, $Res Function(MetadataSourceConfig) _then) = _$MetadataSourceConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled, MetadataSource source
});




}
/// @nodoc
class _$MetadataSourceConfigCopyWithImpl<$Res>
    implements $MetadataSourceConfigCopyWith<$Res> {
  _$MetadataSourceConfigCopyWithImpl(this._self, this._then);

  final MetadataSourceConfig _self;
  final $Res Function(MetadataSourceConfig) _then;

/// Create a copy of MetadataSourceConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? source = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MetadataSource,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataSourceConfig].
extension MetadataSourceConfigPatterns on MetadataSourceConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataSourceConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataSourceConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataSourceConfig value)  $default,){
final _that = this;
switch (_that) {
case _MetadataSourceConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataSourceConfig value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataSourceConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  MetadataSource source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataSourceConfig() when $default != null:
return $default(_that.enabled,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  MetadataSource source)  $default,) {final _that = this;
switch (_that) {
case _MetadataSourceConfig():
return $default(_that.enabled,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  MetadataSource source)?  $default,) {final _that = this;
switch (_that) {
case _MetadataSourceConfig() when $default != null:
return $default(_that.enabled,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetadataSourceConfig implements MetadataSourceConfig {
  const _MetadataSourceConfig({this.enabled = true, required this.source});
  factory _MetadataSourceConfig.fromJson(Map<String, dynamic> json) => _$MetadataSourceConfigFromJson(json);

@override@JsonKey() final  bool enabled;
@override final  MetadataSource source;

/// Create a copy of MetadataSourceConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataSourceConfigCopyWith<_MetadataSourceConfig> get copyWith => __$MetadataSourceConfigCopyWithImpl<_MetadataSourceConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataSourceConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataSourceConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,source);

@override
String toString() {
  return 'MetadataSourceConfig(enabled: $enabled, source: $source)';
}


}

/// @nodoc
abstract mixin class _$MetadataSourceConfigCopyWith<$Res> implements $MetadataSourceConfigCopyWith<$Res> {
  factory _$MetadataSourceConfigCopyWith(_MetadataSourceConfig value, $Res Function(_MetadataSourceConfig) _then) = __$MetadataSourceConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, MetadataSource source
});




}
/// @nodoc
class __$MetadataSourceConfigCopyWithImpl<$Res>
    implements _$MetadataSourceConfigCopyWith<$Res> {
  __$MetadataSourceConfigCopyWithImpl(this._self, this._then);

  final _MetadataSourceConfig _self;
  final $Res Function(_MetadataSourceConfig) _then;

/// Create a copy of MetadataSourceConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? source = null,}) {
  return _then(_MetadataSourceConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MetadataSource,
  ));
}


}

// dart format on
