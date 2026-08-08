// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Search {

@JsonKey(name: "data") List<SearchResults> get results; int get fetchDate;
/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCopyWith<Search> get copyWith => _$SearchCopyWithImpl<Search>(this as Search, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Search&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.fetchDate, fetchDate) || other.fetchDate == fetchDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),fetchDate);

@override
String toString() {
  return 'Search(results: $results, fetchDate: $fetchDate)';
}


}

/// @nodoc
abstract mixin class $SearchCopyWith<$Res>  {
  factory $SearchCopyWith(Search value, $Res Function(Search) _then) = _$SearchCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "data") List<SearchResults> results, int fetchDate
});




}
/// @nodoc
class _$SearchCopyWithImpl<$Res>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._self, this._then);

  final Search _self;
  final $Res Function(Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? fetchDate = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResults>,fetchDate: null == fetchDate ? _self.fetchDate : fetchDate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Search].
extension SearchPatterns on Search {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Search value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Search() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Search value)  $default,){
final _that = this;
switch (_that) {
case _Search():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Search value)?  $default,){
final _that = this;
switch (_that) {
case _Search() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "data")  List<SearchResults> results,  int fetchDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Search() when $default != null:
return $default(_that.results,_that.fetchDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "data")  List<SearchResults> results,  int fetchDate)  $default,) {final _that = this;
switch (_that) {
case _Search():
return $default(_that.results,_that.fetchDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "data")  List<SearchResults> results,  int fetchDate)?  $default,) {final _that = this;
switch (_that) {
case _Search() when $default != null:
return $default(_that.results,_that.fetchDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _Search implements Search {
  const _Search({@JsonKey(name: "data") required final  List<SearchResults> results, required this.fetchDate}): _results = results;
  factory _Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

 final  List<SearchResults> _results;
@override@JsonKey(name: "data") List<SearchResults> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  int fetchDate;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.fetchDate, fetchDate) || other.fetchDate == fetchDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),fetchDate);

@override
String toString() {
  return 'Search(results: $results, fetchDate: $fetchDate)';
}


}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "data") List<SearchResults> results, int fetchDate
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? fetchDate = null,}) {
  return _then(_Search(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResults>,fetchDate: null == fetchDate ? _self.fetchDate : fetchDate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SearchResults {

 String? get name; String? get url; String? get image;
/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<SearchResults> get copyWith => _$SearchResultsCopyWithImpl<SearchResults>(this as SearchResults, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResults&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,image);

@override
String toString() {
  return 'SearchResults(name: $name, url: $url, image: $image)';
}


}

/// @nodoc
abstract mixin class $SearchResultsCopyWith<$Res>  {
  factory $SearchResultsCopyWith(SearchResults value, $Res Function(SearchResults) _then) = _$SearchResultsCopyWithImpl;
@useResult
$Res call({
 String? name, String? url, String? image
});




}
/// @nodoc
class _$SearchResultsCopyWithImpl<$Res>
    implements $SearchResultsCopyWith<$Res> {
  _$SearchResultsCopyWithImpl(this._self, this._then);

  final SearchResults _self;
  final $Res Function(SearchResults) _then;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? url = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResults].
extension SearchResultsPatterns on SearchResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResults value)  $default,){
final _that = this;
switch (_that) {
case _SearchResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResults value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? url,  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
return $default(_that.name,_that.url,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? url,  String? image)  $default,) {final _that = this;
switch (_that) {
case _SearchResults():
return $default(_that.name,_that.url,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? url,  String? image)?  $default,) {final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
return $default(_that.name,_that.url,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _SearchResults implements SearchResults {
  const _SearchResults({this.name, this.url, this.image});
  factory _SearchResults.fromJson(Map<String, dynamic> json) => _$SearchResultsFromJson(json);

@override final  String? name;
@override final  String? url;
@override final  String? image;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultsCopyWith<_SearchResults> get copyWith => __$SearchResultsCopyWithImpl<_SearchResults>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResults&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,image);

@override
String toString() {
  return 'SearchResults(name: $name, url: $url, image: $image)';
}


}

/// @nodoc
abstract mixin class _$SearchResultsCopyWith<$Res> implements $SearchResultsCopyWith<$Res> {
  factory _$SearchResultsCopyWith(_SearchResults value, $Res Function(_SearchResults) _then) = __$SearchResultsCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? url, String? image
});




}
/// @nodoc
class __$SearchResultsCopyWithImpl<$Res>
    implements _$SearchResultsCopyWith<$Res> {
  __$SearchResultsCopyWithImpl(this._self, this._then);

  final _SearchResults _self;
  final $Res Function(_SearchResults) _then;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? url = freezed,Object? image = freezed,}) {
  return _then(_SearchResults(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
