// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_sources.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeSource {

 String get prettyName; String get id;/// The server requested clients to not use metadata providers such as MyAnimeList
 bool get noMetaProvider; String? get recommendations; bool get isHentaiSource; ServerLanguage get lang;
/// Create a copy of AnimeSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeSourceCopyWith<AnimeSource> get copyWith => _$AnimeSourceCopyWithImpl<AnimeSource>(this as AnimeSource, _$identity);

  /// Serializes this AnimeSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeSource&&(identical(other.prettyName, prettyName) || other.prettyName == prettyName)&&(identical(other.id, id) || other.id == id)&&(identical(other.noMetaProvider, noMetaProvider) || other.noMetaProvider == noMetaProvider)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&(identical(other.isHentaiSource, isHentaiSource) || other.isHentaiSource == isHentaiSource)&&(identical(other.lang, lang) || other.lang == lang));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prettyName,id,noMetaProvider,recommendations,isHentaiSource,lang);

@override
String toString() {
  return 'AnimeSource(prettyName: $prettyName, id: $id, noMetaProvider: $noMetaProvider, recommendations: $recommendations, isHentaiSource: $isHentaiSource, lang: $lang)';
}


}

/// @nodoc
abstract mixin class $AnimeSourceCopyWith<$Res>  {
  factory $AnimeSourceCopyWith(AnimeSource value, $Res Function(AnimeSource) _then) = _$AnimeSourceCopyWithImpl;
@useResult
$Res call({
 String prettyName, String id, bool noMetaProvider, String? recommendations, bool isHentaiSource, ServerLanguage lang
});




}
/// @nodoc
class _$AnimeSourceCopyWithImpl<$Res>
    implements $AnimeSourceCopyWith<$Res> {
  _$AnimeSourceCopyWithImpl(this._self, this._then);

  final AnimeSource _self;
  final $Res Function(AnimeSource) _then;

/// Create a copy of AnimeSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prettyName = null,Object? id = null,Object? noMetaProvider = null,Object? recommendations = freezed,Object? isHentaiSource = null,Object? lang = null,}) {
  return _then(_self.copyWith(
prettyName: null == prettyName ? _self.prettyName : prettyName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,noMetaProvider: null == noMetaProvider ? _self.noMetaProvider : noMetaProvider // ignore: cast_nullable_to_non_nullable
as bool,recommendations: freezed == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as String?,isHentaiSource: null == isHentaiSource ? _self.isHentaiSource : isHentaiSource // ignore: cast_nullable_to_non_nullable
as bool,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as ServerLanguage,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeSource].
extension AnimeSourcePatterns on AnimeSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeSource value)  $default,){
final _that = this;
switch (_that) {
case _AnimeSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeSource value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String prettyName,  String id,  bool noMetaProvider,  String? recommendations,  bool isHentaiSource,  ServerLanguage lang)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeSource() when $default != null:
return $default(_that.prettyName,_that.id,_that.noMetaProvider,_that.recommendations,_that.isHentaiSource,_that.lang);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String prettyName,  String id,  bool noMetaProvider,  String? recommendations,  bool isHentaiSource,  ServerLanguage lang)  $default,) {final _that = this;
switch (_that) {
case _AnimeSource():
return $default(_that.prettyName,_that.id,_that.noMetaProvider,_that.recommendations,_that.isHentaiSource,_that.lang);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String prettyName,  String id,  bool noMetaProvider,  String? recommendations,  bool isHentaiSource,  ServerLanguage lang)?  $default,) {final _that = this;
switch (_that) {
case _AnimeSource() when $default != null:
return $default(_that.prettyName,_that.id,_that.noMetaProvider,_that.recommendations,_that.isHentaiSource,_that.lang);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeSource implements AnimeSource {
  const _AnimeSource({required this.prettyName, required this.id, required this.noMetaProvider, this.recommendations, required this.isHentaiSource, required this.lang});
  factory _AnimeSource.fromJson(Map<String, dynamic> json) => _$AnimeSourceFromJson(json);

@override final  String prettyName;
@override final  String id;
/// The server requested clients to not use metadata providers such as MyAnimeList
@override final  bool noMetaProvider;
@override final  String? recommendations;
@override final  bool isHentaiSource;
@override final  ServerLanguage lang;

/// Create a copy of AnimeSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeSourceCopyWith<_AnimeSource> get copyWith => __$AnimeSourceCopyWithImpl<_AnimeSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeSource&&(identical(other.prettyName, prettyName) || other.prettyName == prettyName)&&(identical(other.id, id) || other.id == id)&&(identical(other.noMetaProvider, noMetaProvider) || other.noMetaProvider == noMetaProvider)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&(identical(other.isHentaiSource, isHentaiSource) || other.isHentaiSource == isHentaiSource)&&(identical(other.lang, lang) || other.lang == lang));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prettyName,id,noMetaProvider,recommendations,isHentaiSource,lang);

@override
String toString() {
  return 'AnimeSource(prettyName: $prettyName, id: $id, noMetaProvider: $noMetaProvider, recommendations: $recommendations, isHentaiSource: $isHentaiSource, lang: $lang)';
}


}

/// @nodoc
abstract mixin class _$AnimeSourceCopyWith<$Res> implements $AnimeSourceCopyWith<$Res> {
  factory _$AnimeSourceCopyWith(_AnimeSource value, $Res Function(_AnimeSource) _then) = __$AnimeSourceCopyWithImpl;
@override @useResult
$Res call({
 String prettyName, String id, bool noMetaProvider, String? recommendations, bool isHentaiSource, ServerLanguage lang
});




}
/// @nodoc
class __$AnimeSourceCopyWithImpl<$Res>
    implements _$AnimeSourceCopyWith<$Res> {
  __$AnimeSourceCopyWithImpl(this._self, this._then);

  final _AnimeSource _self;
  final $Res Function(_AnimeSource) _then;

/// Create a copy of AnimeSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prettyName = null,Object? id = null,Object? noMetaProvider = null,Object? recommendations = freezed,Object? isHentaiSource = null,Object? lang = null,}) {
  return _then(_AnimeSource(
prettyName: null == prettyName ? _self.prettyName : prettyName // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,noMetaProvider: null == noMetaProvider ? _self.noMetaProvider : noMetaProvider // ignore: cast_nullable_to_non_nullable
as bool,recommendations: freezed == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as String?,isHentaiSource: null == isHentaiSource ? _self.isHentaiSource : isHentaiSource // ignore: cast_nullable_to_non_nullable
as bool,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as ServerLanguage,
  ));
}


}

// dart format on
