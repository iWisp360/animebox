// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetadataSourceError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataSourceError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MetadataSourceError()';
}


}

/// @nodoc
class $MetadataSourceErrorCopyWith<$Res>  {
$MetadataSourceErrorCopyWith(MetadataSourceError _, $Res Function(MetadataSourceError) __);
}


/// Adds pattern-matching-related methods to [MetadataSourceError].
extension MetadataSourceErrorPatterns on MetadataSourceError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MetadataSourceError_AniList value)?  aniList,TResult Function( MetadataSourceError_MyAnimeList value)?  myAnimeList,TResult Function( MetadataSourceError_IntParse value)?  intParse,TResult Function( MetadataSourceError_PrecisionsParsing value)?  precisionsParsing,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MetadataSourceError_AniList() when aniList != null:
return aniList(_that);case MetadataSourceError_MyAnimeList() when myAnimeList != null:
return myAnimeList(_that);case MetadataSourceError_IntParse() when intParse != null:
return intParse(_that);case MetadataSourceError_PrecisionsParsing() when precisionsParsing != null:
return precisionsParsing(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MetadataSourceError_AniList value)  aniList,required TResult Function( MetadataSourceError_MyAnimeList value)  myAnimeList,required TResult Function( MetadataSourceError_IntParse value)  intParse,required TResult Function( MetadataSourceError_PrecisionsParsing value)  precisionsParsing,}){
final _that = this;
switch (_that) {
case MetadataSourceError_AniList():
return aniList(_that);case MetadataSourceError_MyAnimeList():
return myAnimeList(_that);case MetadataSourceError_IntParse():
return intParse(_that);case MetadataSourceError_PrecisionsParsing():
return precisionsParsing(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MetadataSourceError_AniList value)?  aniList,TResult? Function( MetadataSourceError_MyAnimeList value)?  myAnimeList,TResult? Function( MetadataSourceError_IntParse value)?  intParse,TResult? Function( MetadataSourceError_PrecisionsParsing value)?  precisionsParsing,}){
final _that = this;
switch (_that) {
case MetadataSourceError_AniList() when aniList != null:
return aniList(_that);case MetadataSourceError_MyAnimeList() when myAnimeList != null:
return myAnimeList(_that);case MetadataSourceError_IntParse() when intParse != null:
return intParse(_that);case MetadataSourceError_PrecisionsParsing() when precisionsParsing != null:
return precisionsParsing(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String field0)?  aniList,TResult Function( String field0)?  myAnimeList,TResult Function( String field0)?  intParse,TResult Function()?  precisionsParsing,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MetadataSourceError_AniList() when aniList != null:
return aniList(_that.field0);case MetadataSourceError_MyAnimeList() when myAnimeList != null:
return myAnimeList(_that.field0);case MetadataSourceError_IntParse() when intParse != null:
return intParse(_that.field0);case MetadataSourceError_PrecisionsParsing() when precisionsParsing != null:
return precisionsParsing();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String field0)  aniList,required TResult Function( String field0)  myAnimeList,required TResult Function( String field0)  intParse,required TResult Function()  precisionsParsing,}) {final _that = this;
switch (_that) {
case MetadataSourceError_AniList():
return aniList(_that.field0);case MetadataSourceError_MyAnimeList():
return myAnimeList(_that.field0);case MetadataSourceError_IntParse():
return intParse(_that.field0);case MetadataSourceError_PrecisionsParsing():
return precisionsParsing();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String field0)?  aniList,TResult? Function( String field0)?  myAnimeList,TResult? Function( String field0)?  intParse,TResult? Function()?  precisionsParsing,}) {final _that = this;
switch (_that) {
case MetadataSourceError_AniList() when aniList != null:
return aniList(_that.field0);case MetadataSourceError_MyAnimeList() when myAnimeList != null:
return myAnimeList(_that.field0);case MetadataSourceError_IntParse() when intParse != null:
return intParse(_that.field0);case MetadataSourceError_PrecisionsParsing() when precisionsParsing != null:
return precisionsParsing();case _:
  return null;

}
}

}

/// @nodoc


class MetadataSourceError_AniList extends MetadataSourceError {
  const MetadataSourceError_AniList(this.field0): super._();
  

 final  String field0;

/// Create a copy of MetadataSourceError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataSourceError_AniListCopyWith<MetadataSourceError_AniList> get copyWith => _$MetadataSourceError_AniListCopyWithImpl<MetadataSourceError_AniList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataSourceError_AniList&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'MetadataSourceError.aniList(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $MetadataSourceError_AniListCopyWith<$Res> implements $MetadataSourceErrorCopyWith<$Res> {
  factory $MetadataSourceError_AniListCopyWith(MetadataSourceError_AniList value, $Res Function(MetadataSourceError_AniList) _then) = _$MetadataSourceError_AniListCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$MetadataSourceError_AniListCopyWithImpl<$Res>
    implements $MetadataSourceError_AniListCopyWith<$Res> {
  _$MetadataSourceError_AniListCopyWithImpl(this._self, this._then);

  final MetadataSourceError_AniList _self;
  final $Res Function(MetadataSourceError_AniList) _then;

/// Create a copy of MetadataSourceError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(MetadataSourceError_AniList(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MetadataSourceError_MyAnimeList extends MetadataSourceError {
  const MetadataSourceError_MyAnimeList(this.field0): super._();
  

 final  String field0;

/// Create a copy of MetadataSourceError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataSourceError_MyAnimeListCopyWith<MetadataSourceError_MyAnimeList> get copyWith => _$MetadataSourceError_MyAnimeListCopyWithImpl<MetadataSourceError_MyAnimeList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataSourceError_MyAnimeList&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'MetadataSourceError.myAnimeList(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $MetadataSourceError_MyAnimeListCopyWith<$Res> implements $MetadataSourceErrorCopyWith<$Res> {
  factory $MetadataSourceError_MyAnimeListCopyWith(MetadataSourceError_MyAnimeList value, $Res Function(MetadataSourceError_MyAnimeList) _then) = _$MetadataSourceError_MyAnimeListCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$MetadataSourceError_MyAnimeListCopyWithImpl<$Res>
    implements $MetadataSourceError_MyAnimeListCopyWith<$Res> {
  _$MetadataSourceError_MyAnimeListCopyWithImpl(this._self, this._then);

  final MetadataSourceError_MyAnimeList _self;
  final $Res Function(MetadataSourceError_MyAnimeList) _then;

/// Create a copy of MetadataSourceError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(MetadataSourceError_MyAnimeList(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MetadataSourceError_IntParse extends MetadataSourceError {
  const MetadataSourceError_IntParse(this.field0): super._();
  

 final  String field0;

/// Create a copy of MetadataSourceError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataSourceError_IntParseCopyWith<MetadataSourceError_IntParse> get copyWith => _$MetadataSourceError_IntParseCopyWithImpl<MetadataSourceError_IntParse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataSourceError_IntParse&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'MetadataSourceError.intParse(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $MetadataSourceError_IntParseCopyWith<$Res> implements $MetadataSourceErrorCopyWith<$Res> {
  factory $MetadataSourceError_IntParseCopyWith(MetadataSourceError_IntParse value, $Res Function(MetadataSourceError_IntParse) _then) = _$MetadataSourceError_IntParseCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$MetadataSourceError_IntParseCopyWithImpl<$Res>
    implements $MetadataSourceError_IntParseCopyWith<$Res> {
  _$MetadataSourceError_IntParseCopyWithImpl(this._self, this._then);

  final MetadataSourceError_IntParse _self;
  final $Res Function(MetadataSourceError_IntParse) _then;

/// Create a copy of MetadataSourceError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(MetadataSourceError_IntParse(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MetadataSourceError_PrecisionsParsing extends MetadataSourceError {
  const MetadataSourceError_PrecisionsParsing(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataSourceError_PrecisionsParsing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MetadataSourceError.precisionsParsing()';
}


}




// dart format on
