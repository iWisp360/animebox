// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeBoxConfig {

 bool get firstRun; AppearanceConfig get appearance; MetadataConfig get metadata; DownloadsConfig get downloads; PlaybackConfig get playback; LibraryConfig get library; ServersConfig get servers; LocalStorageConfig get localStorage; AdvancedConfig get advanced;
/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeBoxConfigCopyWith<AnimeBoxConfig> get copyWith => _$AnimeBoxConfigCopyWithImpl<AnimeBoxConfig>(this as AnimeBoxConfig, _$identity);

  /// Serializes this AnimeBoxConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeBoxConfig&&(identical(other.firstRun, firstRun) || other.firstRun == firstRun)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.downloads, downloads) || other.downloads == downloads)&&(identical(other.playback, playback) || other.playback == playback)&&(identical(other.library, library) || other.library == library)&&(identical(other.servers, servers) || other.servers == servers)&&(identical(other.localStorage, localStorage) || other.localStorage == localStorage)&&(identical(other.advanced, advanced) || other.advanced == advanced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstRun,appearance,metadata,downloads,playback,library,servers,localStorage,advanced);

@override
String toString() {
  return 'AnimeBoxConfig(firstRun: $firstRun, appearance: $appearance, metadata: $metadata, downloads: $downloads, playback: $playback, library: $library, servers: $servers, localStorage: $localStorage, advanced: $advanced)';
}


}

/// @nodoc
abstract mixin class $AnimeBoxConfigCopyWith<$Res>  {
  factory $AnimeBoxConfigCopyWith(AnimeBoxConfig value, $Res Function(AnimeBoxConfig) _then) = _$AnimeBoxConfigCopyWithImpl;
@useResult
$Res call({
 bool firstRun, AppearanceConfig appearance, MetadataConfig metadata, DownloadsConfig downloads, PlaybackConfig playback, LibraryConfig library, ServersConfig servers, LocalStorageConfig localStorage, AdvancedConfig advanced
});


$AppearanceConfigCopyWith<$Res> get appearance;$MetadataConfigCopyWith<$Res> get metadata;$DownloadsConfigCopyWith<$Res> get downloads;$PlaybackConfigCopyWith<$Res> get playback;$LibraryConfigCopyWith<$Res> get library;$ServersConfigCopyWith<$Res> get servers;$LocalStorageConfigCopyWith<$Res> get localStorage;$AdvancedConfigCopyWith<$Res> get advanced;

}
/// @nodoc
class _$AnimeBoxConfigCopyWithImpl<$Res>
    implements $AnimeBoxConfigCopyWith<$Res> {
  _$AnimeBoxConfigCopyWithImpl(this._self, this._then);

  final AnimeBoxConfig _self;
  final $Res Function(AnimeBoxConfig) _then;

/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstRun = null,Object? appearance = null,Object? metadata = null,Object? downloads = null,Object? playback = null,Object? library = null,Object? servers = null,Object? localStorage = null,Object? advanced = null,}) {
  return _then(_self.copyWith(
firstRun: null == firstRun ? _self.firstRun : firstRun // ignore: cast_nullable_to_non_nullable
as bool,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as AppearanceConfig,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataConfig,downloads: null == downloads ? _self.downloads : downloads // ignore: cast_nullable_to_non_nullable
as DownloadsConfig,playback: null == playback ? _self.playback : playback // ignore: cast_nullable_to_non_nullable
as PlaybackConfig,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as LibraryConfig,servers: null == servers ? _self.servers : servers // ignore: cast_nullable_to_non_nullable
as ServersConfig,localStorage: null == localStorage ? _self.localStorage : localStorage // ignore: cast_nullable_to_non_nullable
as LocalStorageConfig,advanced: null == advanced ? _self.advanced : advanced // ignore: cast_nullable_to_non_nullable
as AdvancedConfig,
  ));
}
/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppearanceConfigCopyWith<$Res> get appearance {
  
  return $AppearanceConfigCopyWith<$Res>(_self.appearance, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataConfigCopyWith<$Res> get metadata {
  
  return $MetadataConfigCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadsConfigCopyWith<$Res> get downloads {
  
  return $DownloadsConfigCopyWith<$Res>(_self.downloads, (value) {
    return _then(_self.copyWith(downloads: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaybackConfigCopyWith<$Res> get playback {
  
  return $PlaybackConfigCopyWith<$Res>(_self.playback, (value) {
    return _then(_self.copyWith(playback: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryConfigCopyWith<$Res> get library {
  
  return $LibraryConfigCopyWith<$Res>(_self.library, (value) {
    return _then(_self.copyWith(library: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServersConfigCopyWith<$Res> get servers {
  
  return $ServersConfigCopyWith<$Res>(_self.servers, (value) {
    return _then(_self.copyWith(servers: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalStorageConfigCopyWith<$Res> get localStorage {
  
  return $LocalStorageConfigCopyWith<$Res>(_self.localStorage, (value) {
    return _then(_self.copyWith(localStorage: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdvancedConfigCopyWith<$Res> get advanced {
  
  return $AdvancedConfigCopyWith<$Res>(_self.advanced, (value) {
    return _then(_self.copyWith(advanced: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnimeBoxConfig].
extension AnimeBoxConfigPatterns on AnimeBoxConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeBoxConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeBoxConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeBoxConfig value)  $default,){
final _that = this;
switch (_that) {
case _AnimeBoxConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeBoxConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeBoxConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool firstRun,  AppearanceConfig appearance,  MetadataConfig metadata,  DownloadsConfig downloads,  PlaybackConfig playback,  LibraryConfig library,  ServersConfig servers,  LocalStorageConfig localStorage,  AdvancedConfig advanced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeBoxConfig() when $default != null:
return $default(_that.firstRun,_that.appearance,_that.metadata,_that.downloads,_that.playback,_that.library,_that.servers,_that.localStorage,_that.advanced);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool firstRun,  AppearanceConfig appearance,  MetadataConfig metadata,  DownloadsConfig downloads,  PlaybackConfig playback,  LibraryConfig library,  ServersConfig servers,  LocalStorageConfig localStorage,  AdvancedConfig advanced)  $default,) {final _that = this;
switch (_that) {
case _AnimeBoxConfig():
return $default(_that.firstRun,_that.appearance,_that.metadata,_that.downloads,_that.playback,_that.library,_that.servers,_that.localStorage,_that.advanced);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool firstRun,  AppearanceConfig appearance,  MetadataConfig metadata,  DownloadsConfig downloads,  PlaybackConfig playback,  LibraryConfig library,  ServersConfig servers,  LocalStorageConfig localStorage,  AdvancedConfig advanced)?  $default,) {final _that = this;
switch (_that) {
case _AnimeBoxConfig() when $default != null:
return $default(_that.firstRun,_that.appearance,_that.metadata,_that.downloads,_that.playback,_that.library,_that.servers,_that.localStorage,_that.advanced);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeBoxConfig implements AnimeBoxConfig {
  const _AnimeBoxConfig({this.firstRun = true, this.appearance = const AppearanceConfig(), this.metadata = const MetadataConfig(), this.downloads = const DownloadsConfig(), this.playback = const PlaybackConfig(), this.library = const LibraryConfig(), this.servers = const ServersConfig(), this.localStorage = const LocalStorageConfig(), this.advanced = const AdvancedConfig()});
  factory _AnimeBoxConfig.fromJson(Map<String, dynamic> json) => _$AnimeBoxConfigFromJson(json);

@override@JsonKey() final  bool firstRun;
@override@JsonKey() final  AppearanceConfig appearance;
@override@JsonKey() final  MetadataConfig metadata;
@override@JsonKey() final  DownloadsConfig downloads;
@override@JsonKey() final  PlaybackConfig playback;
@override@JsonKey() final  LibraryConfig library;
@override@JsonKey() final  ServersConfig servers;
@override@JsonKey() final  LocalStorageConfig localStorage;
@override@JsonKey() final  AdvancedConfig advanced;

/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeBoxConfigCopyWith<_AnimeBoxConfig> get copyWith => __$AnimeBoxConfigCopyWithImpl<_AnimeBoxConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeBoxConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeBoxConfig&&(identical(other.firstRun, firstRun) || other.firstRun == firstRun)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.downloads, downloads) || other.downloads == downloads)&&(identical(other.playback, playback) || other.playback == playback)&&(identical(other.library, library) || other.library == library)&&(identical(other.servers, servers) || other.servers == servers)&&(identical(other.localStorage, localStorage) || other.localStorage == localStorage)&&(identical(other.advanced, advanced) || other.advanced == advanced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstRun,appearance,metadata,downloads,playback,library,servers,localStorage,advanced);

@override
String toString() {
  return 'AnimeBoxConfig(firstRun: $firstRun, appearance: $appearance, metadata: $metadata, downloads: $downloads, playback: $playback, library: $library, servers: $servers, localStorage: $localStorage, advanced: $advanced)';
}


}

/// @nodoc
abstract mixin class _$AnimeBoxConfigCopyWith<$Res> implements $AnimeBoxConfigCopyWith<$Res> {
  factory _$AnimeBoxConfigCopyWith(_AnimeBoxConfig value, $Res Function(_AnimeBoxConfig) _then) = __$AnimeBoxConfigCopyWithImpl;
@override @useResult
$Res call({
 bool firstRun, AppearanceConfig appearance, MetadataConfig metadata, DownloadsConfig downloads, PlaybackConfig playback, LibraryConfig library, ServersConfig servers, LocalStorageConfig localStorage, AdvancedConfig advanced
});


@override $AppearanceConfigCopyWith<$Res> get appearance;@override $MetadataConfigCopyWith<$Res> get metadata;@override $DownloadsConfigCopyWith<$Res> get downloads;@override $PlaybackConfigCopyWith<$Res> get playback;@override $LibraryConfigCopyWith<$Res> get library;@override $ServersConfigCopyWith<$Res> get servers;@override $LocalStorageConfigCopyWith<$Res> get localStorage;@override $AdvancedConfigCopyWith<$Res> get advanced;

}
/// @nodoc
class __$AnimeBoxConfigCopyWithImpl<$Res>
    implements _$AnimeBoxConfigCopyWith<$Res> {
  __$AnimeBoxConfigCopyWithImpl(this._self, this._then);

  final _AnimeBoxConfig _self;
  final $Res Function(_AnimeBoxConfig) _then;

/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstRun = null,Object? appearance = null,Object? metadata = null,Object? downloads = null,Object? playback = null,Object? library = null,Object? servers = null,Object? localStorage = null,Object? advanced = null,}) {
  return _then(_AnimeBoxConfig(
firstRun: null == firstRun ? _self.firstRun : firstRun // ignore: cast_nullable_to_non_nullable
as bool,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as AppearanceConfig,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataConfig,downloads: null == downloads ? _self.downloads : downloads // ignore: cast_nullable_to_non_nullable
as DownloadsConfig,playback: null == playback ? _self.playback : playback // ignore: cast_nullable_to_non_nullable
as PlaybackConfig,library: null == library ? _self.library : library // ignore: cast_nullable_to_non_nullable
as LibraryConfig,servers: null == servers ? _self.servers : servers // ignore: cast_nullable_to_non_nullable
as ServersConfig,localStorage: null == localStorage ? _self.localStorage : localStorage // ignore: cast_nullable_to_non_nullable
as LocalStorageConfig,advanced: null == advanced ? _self.advanced : advanced // ignore: cast_nullable_to_non_nullable
as AdvancedConfig,
  ));
}

/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppearanceConfigCopyWith<$Res> get appearance {
  
  return $AppearanceConfigCopyWith<$Res>(_self.appearance, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataConfigCopyWith<$Res> get metadata {
  
  return $MetadataConfigCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DownloadsConfigCopyWith<$Res> get downloads {
  
  return $DownloadsConfigCopyWith<$Res>(_self.downloads, (value) {
    return _then(_self.copyWith(downloads: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlaybackConfigCopyWith<$Res> get playback {
  
  return $PlaybackConfigCopyWith<$Res>(_self.playback, (value) {
    return _then(_self.copyWith(playback: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryConfigCopyWith<$Res> get library {
  
  return $LibraryConfigCopyWith<$Res>(_self.library, (value) {
    return _then(_self.copyWith(library: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServersConfigCopyWith<$Res> get servers {
  
  return $ServersConfigCopyWith<$Res>(_self.servers, (value) {
    return _then(_self.copyWith(servers: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalStorageConfigCopyWith<$Res> get localStorage {
  
  return $LocalStorageConfigCopyWith<$Res>(_self.localStorage, (value) {
    return _then(_self.copyWith(localStorage: value));
  });
}/// Create a copy of AnimeBoxConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdvancedConfigCopyWith<$Res> get advanced {
  
  return $AdvancedConfigCopyWith<$Res>(_self.advanced, (value) {
    return _then(_self.copyWith(advanced: value));
  });
}
}

// dart format on
