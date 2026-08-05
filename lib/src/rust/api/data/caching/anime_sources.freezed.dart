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
mixin _$SourcesRefreshError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourcesRefreshError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SourcesRefreshError()';
}


}

/// @nodoc
class $SourcesRefreshErrorCopyWith<$Res>  {
$SourcesRefreshErrorCopyWith(SourcesRefreshError _, $Res Function(SourcesRefreshError) __);
}


/// Adds pattern-matching-related methods to [SourcesRefreshError].
extension SourcesRefreshErrorPatterns on SourcesRefreshError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SourcesRefreshError_GraphQL value)?  graphQl,TResult Function( SourcesRefreshError_InvalidData value)?  invalidData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SourcesRefreshError_GraphQL() when graphQl != null:
return graphQl(_that);case SourcesRefreshError_InvalidData() when invalidData != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SourcesRefreshError_GraphQL value)  graphQl,required TResult Function( SourcesRefreshError_InvalidData value)  invalidData,}){
final _that = this;
switch (_that) {
case SourcesRefreshError_GraphQL():
return graphQl(_that);case SourcesRefreshError_InvalidData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SourcesRefreshError_GraphQL value)?  graphQl,TResult? Function( SourcesRefreshError_InvalidData value)?  invalidData,}){
final _that = this;
switch (_that) {
case SourcesRefreshError_GraphQL() when graphQl != null:
return graphQl(_that);case SourcesRefreshError_InvalidData() when invalidData != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String field0)?  graphQl,TResult Function()?  invalidData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SourcesRefreshError_GraphQL() when graphQl != null:
return graphQl(_that.field0);case SourcesRefreshError_InvalidData() when invalidData != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String field0)  graphQl,required TResult Function()  invalidData,}) {final _that = this;
switch (_that) {
case SourcesRefreshError_GraphQL():
return graphQl(_that.field0);case SourcesRefreshError_InvalidData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String field0)?  graphQl,TResult? Function()?  invalidData,}) {final _that = this;
switch (_that) {
case SourcesRefreshError_GraphQL() when graphQl != null:
return graphQl(_that.field0);case SourcesRefreshError_InvalidData() when invalidData != null:
return invalidData();case _:
  return null;

}
}

}

/// @nodoc


class SourcesRefreshError_GraphQL extends SourcesRefreshError {
  const SourcesRefreshError_GraphQL(this.field0): super._();
  

 final  String field0;

/// Create a copy of SourcesRefreshError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourcesRefreshError_GraphQLCopyWith<SourcesRefreshError_GraphQL> get copyWith => _$SourcesRefreshError_GraphQLCopyWithImpl<SourcesRefreshError_GraphQL>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourcesRefreshError_GraphQL&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'SourcesRefreshError.graphQl(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $SourcesRefreshError_GraphQLCopyWith<$Res> implements $SourcesRefreshErrorCopyWith<$Res> {
  factory $SourcesRefreshError_GraphQLCopyWith(SourcesRefreshError_GraphQL value, $Res Function(SourcesRefreshError_GraphQL) _then) = _$SourcesRefreshError_GraphQLCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$SourcesRefreshError_GraphQLCopyWithImpl<$Res>
    implements $SourcesRefreshError_GraphQLCopyWith<$Res> {
  _$SourcesRefreshError_GraphQLCopyWithImpl(this._self, this._then);

  final SourcesRefreshError_GraphQL _self;
  final $Res Function(SourcesRefreshError_GraphQL) _then;

/// Create a copy of SourcesRefreshError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(SourcesRefreshError_GraphQL(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SourcesRefreshError_InvalidData extends SourcesRefreshError {
  const SourcesRefreshError_InvalidData(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourcesRefreshError_InvalidData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SourcesRefreshError.invalidData()';
}


}




// dart format on
