// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controllers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConfigError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConfigError()';
}


}

/// @nodoc
class $ConfigErrorCopyWith<$Res>  {
$ConfigErrorCopyWith(ConfigError _, $Res Function(ConfigError) __);
}


/// Adds pattern-matching-related methods to [ConfigError].
extension ConfigErrorPatterns on ConfigError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConfigError_InputOutput value)?  inputOutput,TResult Function( ConfigError_Infallible value)?  infallible,TResult Function( ConfigError_RonSpanned value)?  ronSpanned,TResult Function( ConfigError_Ron value)?  ron,TResult Function( ConfigError_NonInitializedConfig value)?  nonInitializedConfig,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConfigError_InputOutput() when inputOutput != null:
return inputOutput(_that);case ConfigError_Infallible() when infallible != null:
return infallible(_that);case ConfigError_RonSpanned() when ronSpanned != null:
return ronSpanned(_that);case ConfigError_Ron() when ron != null:
return ron(_that);case ConfigError_NonInitializedConfig() when nonInitializedConfig != null:
return nonInitializedConfig(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConfigError_InputOutput value)  inputOutput,required TResult Function( ConfigError_Infallible value)  infallible,required TResult Function( ConfigError_RonSpanned value)  ronSpanned,required TResult Function( ConfigError_Ron value)  ron,required TResult Function( ConfigError_NonInitializedConfig value)  nonInitializedConfig,}){
final _that = this;
switch (_that) {
case ConfigError_InputOutput():
return inputOutput(_that);case ConfigError_Infallible():
return infallible(_that);case ConfigError_RonSpanned():
return ronSpanned(_that);case ConfigError_Ron():
return ron(_that);case ConfigError_NonInitializedConfig():
return nonInitializedConfig(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConfigError_InputOutput value)?  inputOutput,TResult? Function( ConfigError_Infallible value)?  infallible,TResult? Function( ConfigError_RonSpanned value)?  ronSpanned,TResult? Function( ConfigError_Ron value)?  ron,TResult? Function( ConfigError_NonInitializedConfig value)?  nonInitializedConfig,}){
final _that = this;
switch (_that) {
case ConfigError_InputOutput() when inputOutput != null:
return inputOutput(_that);case ConfigError_Infallible() when infallible != null:
return infallible(_that);case ConfigError_RonSpanned() when ronSpanned != null:
return ronSpanned(_that);case ConfigError_Ron() when ron != null:
return ron(_that);case ConfigError_NonInitializedConfig() when nonInitializedConfig != null:
return nonInitializedConfig(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String field0)?  inputOutput,TResult Function( String field0)?  infallible,TResult Function( String field0)?  ronSpanned,TResult Function( String field0)?  ron,TResult Function()?  nonInitializedConfig,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConfigError_InputOutput() when inputOutput != null:
return inputOutput(_that.field0);case ConfigError_Infallible() when infallible != null:
return infallible(_that.field0);case ConfigError_RonSpanned() when ronSpanned != null:
return ronSpanned(_that.field0);case ConfigError_Ron() when ron != null:
return ron(_that.field0);case ConfigError_NonInitializedConfig() when nonInitializedConfig != null:
return nonInitializedConfig();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String field0)  inputOutput,required TResult Function( String field0)  infallible,required TResult Function( String field0)  ronSpanned,required TResult Function( String field0)  ron,required TResult Function()  nonInitializedConfig,}) {final _that = this;
switch (_that) {
case ConfigError_InputOutput():
return inputOutput(_that.field0);case ConfigError_Infallible():
return infallible(_that.field0);case ConfigError_RonSpanned():
return ronSpanned(_that.field0);case ConfigError_Ron():
return ron(_that.field0);case ConfigError_NonInitializedConfig():
return nonInitializedConfig();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String field0)?  inputOutput,TResult? Function( String field0)?  infallible,TResult? Function( String field0)?  ronSpanned,TResult? Function( String field0)?  ron,TResult? Function()?  nonInitializedConfig,}) {final _that = this;
switch (_that) {
case ConfigError_InputOutput() when inputOutput != null:
return inputOutput(_that.field0);case ConfigError_Infallible() when infallible != null:
return infallible(_that.field0);case ConfigError_RonSpanned() when ronSpanned != null:
return ronSpanned(_that.field0);case ConfigError_Ron() when ron != null:
return ron(_that.field0);case ConfigError_NonInitializedConfig() when nonInitializedConfig != null:
return nonInitializedConfig();case _:
  return null;

}
}

}

/// @nodoc


class ConfigError_InputOutput extends ConfigError {
  const ConfigError_InputOutput(this.field0): super._();
  

 final  String field0;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigError_InputOutputCopyWith<ConfigError_InputOutput> get copyWith => _$ConfigError_InputOutputCopyWithImpl<ConfigError_InputOutput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigError_InputOutput&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ConfigError.inputOutput(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ConfigError_InputOutputCopyWith<$Res> implements $ConfigErrorCopyWith<$Res> {
  factory $ConfigError_InputOutputCopyWith(ConfigError_InputOutput value, $Res Function(ConfigError_InputOutput) _then) = _$ConfigError_InputOutputCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$ConfigError_InputOutputCopyWithImpl<$Res>
    implements $ConfigError_InputOutputCopyWith<$Res> {
  _$ConfigError_InputOutputCopyWithImpl(this._self, this._then);

  final ConfigError_InputOutput _self;
  final $Res Function(ConfigError_InputOutput) _then;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ConfigError_InputOutput(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfigError_Infallible extends ConfigError {
  const ConfigError_Infallible(this.field0): super._();
  

 final  String field0;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigError_InfallibleCopyWith<ConfigError_Infallible> get copyWith => _$ConfigError_InfallibleCopyWithImpl<ConfigError_Infallible>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigError_Infallible&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ConfigError.infallible(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ConfigError_InfallibleCopyWith<$Res> implements $ConfigErrorCopyWith<$Res> {
  factory $ConfigError_InfallibleCopyWith(ConfigError_Infallible value, $Res Function(ConfigError_Infallible) _then) = _$ConfigError_InfallibleCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$ConfigError_InfallibleCopyWithImpl<$Res>
    implements $ConfigError_InfallibleCopyWith<$Res> {
  _$ConfigError_InfallibleCopyWithImpl(this._self, this._then);

  final ConfigError_Infallible _self;
  final $Res Function(ConfigError_Infallible) _then;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ConfigError_Infallible(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfigError_RonSpanned extends ConfigError {
  const ConfigError_RonSpanned(this.field0): super._();
  

 final  String field0;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigError_RonSpannedCopyWith<ConfigError_RonSpanned> get copyWith => _$ConfigError_RonSpannedCopyWithImpl<ConfigError_RonSpanned>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigError_RonSpanned&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ConfigError.ronSpanned(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ConfigError_RonSpannedCopyWith<$Res> implements $ConfigErrorCopyWith<$Res> {
  factory $ConfigError_RonSpannedCopyWith(ConfigError_RonSpanned value, $Res Function(ConfigError_RonSpanned) _then) = _$ConfigError_RonSpannedCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$ConfigError_RonSpannedCopyWithImpl<$Res>
    implements $ConfigError_RonSpannedCopyWith<$Res> {
  _$ConfigError_RonSpannedCopyWithImpl(this._self, this._then);

  final ConfigError_RonSpanned _self;
  final $Res Function(ConfigError_RonSpanned) _then;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ConfigError_RonSpanned(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfigError_Ron extends ConfigError {
  const ConfigError_Ron(this.field0): super._();
  

 final  String field0;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigError_RonCopyWith<ConfigError_Ron> get copyWith => _$ConfigError_RonCopyWithImpl<ConfigError_Ron>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigError_Ron&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ConfigError.ron(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ConfigError_RonCopyWith<$Res> implements $ConfigErrorCopyWith<$Res> {
  factory $ConfigError_RonCopyWith(ConfigError_Ron value, $Res Function(ConfigError_Ron) _then) = _$ConfigError_RonCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$ConfigError_RonCopyWithImpl<$Res>
    implements $ConfigError_RonCopyWith<$Res> {
  _$ConfigError_RonCopyWithImpl(this._self, this._then);

  final ConfigError_Ron _self;
  final $Res Function(ConfigError_Ron) _then;

/// Create a copy of ConfigError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ConfigError_Ron(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfigError_NonInitializedConfig extends ConfigError {
  const ConfigError_NonInitializedConfig(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigError_NonInitializedConfig);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConfigError.nonInitializedConfig()';
}


}




// dart format on
