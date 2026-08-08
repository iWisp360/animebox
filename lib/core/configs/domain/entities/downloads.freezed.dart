// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadsConfig {

 bool get unmeteredNetworksOnly; String get downloadedEpisodesFormat; int get maxDownloadThreads;
/// Create a copy of DownloadsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadsConfigCopyWith<DownloadsConfig> get copyWith => _$DownloadsConfigCopyWithImpl<DownloadsConfig>(this as DownloadsConfig, _$identity);

  /// Serializes this DownloadsConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadsConfig&&(identical(other.unmeteredNetworksOnly, unmeteredNetworksOnly) || other.unmeteredNetworksOnly == unmeteredNetworksOnly)&&(identical(other.downloadedEpisodesFormat, downloadedEpisodesFormat) || other.downloadedEpisodesFormat == downloadedEpisodesFormat)&&(identical(other.maxDownloadThreads, maxDownloadThreads) || other.maxDownloadThreads == maxDownloadThreads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unmeteredNetworksOnly,downloadedEpisodesFormat,maxDownloadThreads);

@override
String toString() {
  return 'DownloadsConfig(unmeteredNetworksOnly: $unmeteredNetworksOnly, downloadedEpisodesFormat: $downloadedEpisodesFormat, maxDownloadThreads: $maxDownloadThreads)';
}


}

/// @nodoc
abstract mixin class $DownloadsConfigCopyWith<$Res>  {
  factory $DownloadsConfigCopyWith(DownloadsConfig value, $Res Function(DownloadsConfig) _then) = _$DownloadsConfigCopyWithImpl;
@useResult
$Res call({
 bool unmeteredNetworksOnly, String downloadedEpisodesFormat, int maxDownloadThreads
});




}
/// @nodoc
class _$DownloadsConfigCopyWithImpl<$Res>
    implements $DownloadsConfigCopyWith<$Res> {
  _$DownloadsConfigCopyWithImpl(this._self, this._then);

  final DownloadsConfig _self;
  final $Res Function(DownloadsConfig) _then;

/// Create a copy of DownloadsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unmeteredNetworksOnly = null,Object? downloadedEpisodesFormat = null,Object? maxDownloadThreads = null,}) {
  return _then(_self.copyWith(
unmeteredNetworksOnly: null == unmeteredNetworksOnly ? _self.unmeteredNetworksOnly : unmeteredNetworksOnly // ignore: cast_nullable_to_non_nullable
as bool,downloadedEpisodesFormat: null == downloadedEpisodesFormat ? _self.downloadedEpisodesFormat : downloadedEpisodesFormat // ignore: cast_nullable_to_non_nullable
as String,maxDownloadThreads: null == maxDownloadThreads ? _self.maxDownloadThreads : maxDownloadThreads // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DownloadsConfig].
extension DownloadsConfigPatterns on DownloadsConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DownloadsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DownloadsConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DownloadsConfig value)  $default,){
final _that = this;
switch (_that) {
case _DownloadsConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DownloadsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _DownloadsConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool unmeteredNetworksOnly,  String downloadedEpisodesFormat,  int maxDownloadThreads)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DownloadsConfig() when $default != null:
return $default(_that.unmeteredNetworksOnly,_that.downloadedEpisodesFormat,_that.maxDownloadThreads);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool unmeteredNetworksOnly,  String downloadedEpisodesFormat,  int maxDownloadThreads)  $default,) {final _that = this;
switch (_that) {
case _DownloadsConfig():
return $default(_that.unmeteredNetworksOnly,_that.downloadedEpisodesFormat,_that.maxDownloadThreads);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool unmeteredNetworksOnly,  String downloadedEpisodesFormat,  int maxDownloadThreads)?  $default,) {final _that = this;
switch (_that) {
case _DownloadsConfig() when $default != null:
return $default(_that.unmeteredNetworksOnly,_that.downloadedEpisodesFormat,_that.maxDownloadThreads);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DownloadsConfig implements DownloadsConfig {
  const _DownloadsConfig({this.unmeteredNetworksOnly = false, this.downloadedEpisodesFormat = "%e %n", this.maxDownloadThreads = 4});
  factory _DownloadsConfig.fromJson(Map<String, dynamic> json) => _$DownloadsConfigFromJson(json);

@override@JsonKey() final  bool unmeteredNetworksOnly;
@override@JsonKey() final  String downloadedEpisodesFormat;
@override@JsonKey() final  int maxDownloadThreads;

/// Create a copy of DownloadsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownloadsConfigCopyWith<_DownloadsConfig> get copyWith => __$DownloadsConfigCopyWithImpl<_DownloadsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DownloadsConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DownloadsConfig&&(identical(other.unmeteredNetworksOnly, unmeteredNetworksOnly) || other.unmeteredNetworksOnly == unmeteredNetworksOnly)&&(identical(other.downloadedEpisodesFormat, downloadedEpisodesFormat) || other.downloadedEpisodesFormat == downloadedEpisodesFormat)&&(identical(other.maxDownloadThreads, maxDownloadThreads) || other.maxDownloadThreads == maxDownloadThreads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unmeteredNetworksOnly,downloadedEpisodesFormat,maxDownloadThreads);

@override
String toString() {
  return 'DownloadsConfig(unmeteredNetworksOnly: $unmeteredNetworksOnly, downloadedEpisodesFormat: $downloadedEpisodesFormat, maxDownloadThreads: $maxDownloadThreads)';
}


}

/// @nodoc
abstract mixin class _$DownloadsConfigCopyWith<$Res> implements $DownloadsConfigCopyWith<$Res> {
  factory _$DownloadsConfigCopyWith(_DownloadsConfig value, $Res Function(_DownloadsConfig) _then) = __$DownloadsConfigCopyWithImpl;
@override @useResult
$Res call({
 bool unmeteredNetworksOnly, String downloadedEpisodesFormat, int maxDownloadThreads
});




}
/// @nodoc
class __$DownloadsConfigCopyWithImpl<$Res>
    implements _$DownloadsConfigCopyWith<$Res> {
  __$DownloadsConfigCopyWithImpl(this._self, this._then);

  final _DownloadsConfig _self;
  final $Res Function(_DownloadsConfig) _then;

/// Create a copy of DownloadsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unmeteredNetworksOnly = null,Object? downloadedEpisodesFormat = null,Object? maxDownloadThreads = null,}) {
  return _then(_DownloadsConfig(
unmeteredNetworksOnly: null == unmeteredNetworksOnly ? _self.unmeteredNetworksOnly : unmeteredNetworksOnly // ignore: cast_nullable_to_non_nullable
as bool,downloadedEpisodesFormat: null == downloadedEpisodesFormat ? _self.downloadedEpisodesFormat : downloadedEpisodesFormat // ignore: cast_nullable_to_non_nullable
as String,maxDownloadThreads: null == maxDownloadThreads ? _self.maxDownloadThreads : maxDownloadThreads // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
