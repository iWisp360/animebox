// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Server {

 String? get name; String? get logoUrl; String? get url; String get uuid; int get minCompat; List<AnimeSource> get supportedAnimeSources;
/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerCopyWith<Server> get copyWith => _$ServerCopyWithImpl<Server>(this as Server, _$identity);

  /// Serializes this Server to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Server&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.minCompat, minCompat) || other.minCompat == minCompat)&&const DeepCollectionEquality().equals(other.supportedAnimeSources, supportedAnimeSources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,logoUrl,url,uuid,minCompat,const DeepCollectionEquality().hash(supportedAnimeSources));

@override
String toString() {
  return 'Server(name: $name, logoUrl: $logoUrl, url: $url, uuid: $uuid, minCompat: $minCompat, supportedAnimeSources: $supportedAnimeSources)';
}


}

/// @nodoc
abstract mixin class $ServerCopyWith<$Res>  {
  factory $ServerCopyWith(Server value, $Res Function(Server) _then) = _$ServerCopyWithImpl;
@useResult
$Res call({
 String? name, String? logoUrl, String? url, String uuid, int minCompat, List<AnimeSource> supportedAnimeSources
});




}
/// @nodoc
class _$ServerCopyWithImpl<$Res>
    implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._self, this._then);

  final Server _self;
  final $Res Function(Server) _then;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? logoUrl = freezed,Object? url = freezed,Object? uuid = null,Object? minCompat = null,Object? supportedAnimeSources = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,minCompat: null == minCompat ? _self.minCompat : minCompat // ignore: cast_nullable_to_non_nullable
as int,supportedAnimeSources: null == supportedAnimeSources ? _self.supportedAnimeSources : supportedAnimeSources // ignore: cast_nullable_to_non_nullable
as List<AnimeSource>,
  ));
}

}


/// Adds pattern-matching-related methods to [Server].
extension ServerPatterns on Server {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Server value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Server() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Server value)  $default,){
final _that = this;
switch (_that) {
case _Server():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Server value)?  $default,){
final _that = this;
switch (_that) {
case _Server() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? logoUrl,  String? url,  String uuid,  int minCompat,  List<AnimeSource> supportedAnimeSources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Server() when $default != null:
return $default(_that.name,_that.logoUrl,_that.url,_that.uuid,_that.minCompat,_that.supportedAnimeSources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? logoUrl,  String? url,  String uuid,  int minCompat,  List<AnimeSource> supportedAnimeSources)  $default,) {final _that = this;
switch (_that) {
case _Server():
return $default(_that.name,_that.logoUrl,_that.url,_that.uuid,_that.minCompat,_that.supportedAnimeSources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? logoUrl,  String? url,  String uuid,  int minCompat,  List<AnimeSource> supportedAnimeSources)?  $default,) {final _that = this;
switch (_that) {
case _Server() when $default != null:
return $default(_that.name,_that.logoUrl,_that.url,_that.uuid,_that.minCompat,_that.supportedAnimeSources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Server implements Server {
  const _Server({this.name, this.logoUrl, this.url, required this.uuid, required this.minCompat, required final  List<AnimeSource> supportedAnimeSources}): _supportedAnimeSources = supportedAnimeSources;
  factory _Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

@override final  String? name;
@override final  String? logoUrl;
@override final  String? url;
@override final  String uuid;
@override final  int minCompat;
 final  List<AnimeSource> _supportedAnimeSources;
@override List<AnimeSource> get supportedAnimeSources {
  if (_supportedAnimeSources is EqualUnmodifiableListView) return _supportedAnimeSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportedAnimeSources);
}


/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerCopyWith<_Server> get copyWith => __$ServerCopyWithImpl<_Server>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Server&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.minCompat, minCompat) || other.minCompat == minCompat)&&const DeepCollectionEquality().equals(other._supportedAnimeSources, _supportedAnimeSources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,logoUrl,url,uuid,minCompat,const DeepCollectionEquality().hash(_supportedAnimeSources));

@override
String toString() {
  return 'Server(name: $name, logoUrl: $logoUrl, url: $url, uuid: $uuid, minCompat: $minCompat, supportedAnimeSources: $supportedAnimeSources)';
}


}

/// @nodoc
abstract mixin class _$ServerCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) _then) = __$ServerCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? logoUrl, String? url, String uuid, int minCompat, List<AnimeSource> supportedAnimeSources
});




}
/// @nodoc
class __$ServerCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(this._self, this._then);

  final _Server _self;
  final $Res Function(_Server) _then;

/// Create a copy of Server
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? logoUrl = freezed,Object? url = freezed,Object? uuid = null,Object? minCompat = null,Object? supportedAnimeSources = null,}) {
  return _then(_Server(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,minCompat: null == minCompat ? _self.minCompat : minCompat // ignore: cast_nullable_to_non_nullable
as int,supportedAnimeSources: null == supportedAnimeSources ? _self._supportedAnimeSources : supportedAnimeSources // ignore: cast_nullable_to_non_nullable
as List<AnimeSource>,
  ));
}


}

// dart format on
