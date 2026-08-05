// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utils.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CacheError {

 String get field0;
/// Create a copy of CacheError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheErrorCopyWith<CacheError> get copyWith => _$CacheErrorCopyWithImpl<CacheError>(this as CacheError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheError&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'CacheError(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $CacheErrorCopyWith<$Res>  {
  factory $CacheErrorCopyWith(CacheError value, $Res Function(CacheError) _then) = _$CacheErrorCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$CacheErrorCopyWithImpl<$Res>
    implements $CacheErrorCopyWith<$Res> {
  _$CacheErrorCopyWithImpl(this._self, this._then);

  final CacheError _self;
  final $Res Function(CacheError) _then;

/// Create a copy of CacheError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? field0 = null,}) {
  return _then(_self.copyWith(
field0: null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CacheError].
extension CacheErrorPatterns on CacheError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CacheError_InputOutput value)?  inputOutput,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CacheError_InputOutput() when inputOutput != null:
return inputOutput(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CacheError_InputOutput value)  inputOutput,}){
final _that = this;
switch (_that) {
case CacheError_InputOutput():
return inputOutput(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CacheError_InputOutput value)?  inputOutput,}){
final _that = this;
switch (_that) {
case CacheError_InputOutput() when inputOutput != null:
return inputOutput(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String field0)?  inputOutput,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CacheError_InputOutput() when inputOutput != null:
return inputOutput(_that.field0);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String field0)  inputOutput,}) {final _that = this;
switch (_that) {
case CacheError_InputOutput():
return inputOutput(_that.field0);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String field0)?  inputOutput,}) {final _that = this;
switch (_that) {
case CacheError_InputOutput() when inputOutput != null:
return inputOutput(_that.field0);case _:
  return null;

}
}

}

/// @nodoc


class CacheError_InputOutput extends CacheError {
  const CacheError_InputOutput(this.field0): super._();
  

@override final  String field0;

/// Create a copy of CacheError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheError_InputOutputCopyWith<CacheError_InputOutput> get copyWith => _$CacheError_InputOutputCopyWithImpl<CacheError_InputOutput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheError_InputOutput&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'CacheError.inputOutput(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $CacheError_InputOutputCopyWith<$Res> implements $CacheErrorCopyWith<$Res> {
  factory $CacheError_InputOutputCopyWith(CacheError_InputOutput value, $Res Function(CacheError_InputOutput) _then) = _$CacheError_InputOutputCopyWithImpl;
@override @useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$CacheError_InputOutputCopyWithImpl<$Res>
    implements $CacheError_InputOutputCopyWith<$Res> {
  _$CacheError_InputOutputCopyWithImpl(this._self, this._then);

  final CacheError_InputOutput _self;
  final $Res Function(CacheError_InputOutput) _then;

/// Create a copy of CacheError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(CacheError_InputOutput(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
