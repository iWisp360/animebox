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
mixin _$CacheRefreshError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheRefreshError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CacheRefreshError()';
}


}

/// @nodoc
class $CacheRefreshErrorCopyWith<$Res>  {
$CacheRefreshErrorCopyWith(CacheRefreshError _, $Res Function(CacheRefreshError) __);
}


/// Adds pattern-matching-related methods to [CacheRefreshError].
extension CacheRefreshErrorPatterns on CacheRefreshError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CacheRefreshError_ConnectionOrDeserializationFailed value)?  connectionOrDeserializationFailed,TResult Function( CacheRefreshError_InvalidData value)?  invalidData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CacheRefreshError_ConnectionOrDeserializationFailed() when connectionOrDeserializationFailed != null:
return connectionOrDeserializationFailed(_that);case CacheRefreshError_InvalidData() when invalidData != null:
return invalidData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CacheRefreshError_ConnectionOrDeserializationFailed value)  connectionOrDeserializationFailed,required TResult Function( CacheRefreshError_InvalidData value)  invalidData,}){
final _that = this;
switch (_that) {
case CacheRefreshError_ConnectionOrDeserializationFailed():
return connectionOrDeserializationFailed(_that);case CacheRefreshError_InvalidData():
return invalidData(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CacheRefreshError_ConnectionOrDeserializationFailed value)?  connectionOrDeserializationFailed,TResult? Function( CacheRefreshError_InvalidData value)?  invalidData,}){
final _that = this;
switch (_that) {
case CacheRefreshError_ConnectionOrDeserializationFailed() when connectionOrDeserializationFailed != null:
return connectionOrDeserializationFailed(_that);case CacheRefreshError_InvalidData() when invalidData != null:
return invalidData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String field0)?  connectionOrDeserializationFailed,TResult Function()?  invalidData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CacheRefreshError_ConnectionOrDeserializationFailed() when connectionOrDeserializationFailed != null:
return connectionOrDeserializationFailed(_that.field0);case CacheRefreshError_InvalidData() when invalidData != null:
return invalidData();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String field0)  connectionOrDeserializationFailed,required TResult Function()  invalidData,}) {final _that = this;
switch (_that) {
case CacheRefreshError_ConnectionOrDeserializationFailed():
return connectionOrDeserializationFailed(_that.field0);case CacheRefreshError_InvalidData():
return invalidData();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String field0)?  connectionOrDeserializationFailed,TResult? Function()?  invalidData,}) {final _that = this;
switch (_that) {
case CacheRefreshError_ConnectionOrDeserializationFailed() when connectionOrDeserializationFailed != null:
return connectionOrDeserializationFailed(_that.field0);case CacheRefreshError_InvalidData() when invalidData != null:
return invalidData();case _:
  return null;

}
}

}

/// @nodoc


class CacheRefreshError_ConnectionOrDeserializationFailed extends CacheRefreshError {
  const CacheRefreshError_ConnectionOrDeserializationFailed(this.field0): super._();
  

 final  String field0;

/// Create a copy of CacheRefreshError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheRefreshError_ConnectionOrDeserializationFailedCopyWith<CacheRefreshError_ConnectionOrDeserializationFailed> get copyWith => _$CacheRefreshError_ConnectionOrDeserializationFailedCopyWithImpl<CacheRefreshError_ConnectionOrDeserializationFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheRefreshError_ConnectionOrDeserializationFailed&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'CacheRefreshError.connectionOrDeserializationFailed(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $CacheRefreshError_ConnectionOrDeserializationFailedCopyWith<$Res> implements $CacheRefreshErrorCopyWith<$Res> {
  factory $CacheRefreshError_ConnectionOrDeserializationFailedCopyWith(CacheRefreshError_ConnectionOrDeserializationFailed value, $Res Function(CacheRefreshError_ConnectionOrDeserializationFailed) _then) = _$CacheRefreshError_ConnectionOrDeserializationFailedCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$CacheRefreshError_ConnectionOrDeserializationFailedCopyWithImpl<$Res>
    implements $CacheRefreshError_ConnectionOrDeserializationFailedCopyWith<$Res> {
  _$CacheRefreshError_ConnectionOrDeserializationFailedCopyWithImpl(this._self, this._then);

  final CacheRefreshError_ConnectionOrDeserializationFailed _self;
  final $Res Function(CacheRefreshError_ConnectionOrDeserializationFailed) _then;

/// Create a copy of CacheRefreshError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(CacheRefreshError_ConnectionOrDeserializationFailed(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CacheRefreshError_InvalidData extends CacheRefreshError {
  const CacheRefreshError_InvalidData(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheRefreshError_InvalidData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CacheRefreshError.invalidData()';
}


}




// dart format on
