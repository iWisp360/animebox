import 'package:freezed_annotation/freezed_annotation.dart';

part 'library.g.dart';
part 'library.freezed.dart';

@freezed
abstract class LibraryConfig with _$LibraryConfig {
  const factory LibraryConfig({
    // TODO: Use when library page is implemented
    @Default([]) List<String> customCategories,
    String? defaultCategory,

    @Default(LibraryAutoUpdateConfig())
    LibraryAutoUpdateConfig libraryAutoUpdateParams,
  }) = _LibraryConfig;

  factory LibraryConfig.fromJson(Map<String, dynamic> json) =>
      _$LibraryConfigFromJson(json);
}

@freezed
abstract class LibraryAutoUpdateConfig with _$LibraryAutoUpdateConfig {
  const factory LibraryAutoUpdateConfig({
    @Default(false) bool enable,

    /// Interval in hours to update the library automatically
    @Default(6) int interval,
    @Default(false) bool allowMobileData,
    @Default(true) bool avoidWatchedSeries,
    @Default(true) bool avoidCompletedSeries,
  }) = _LibraryAutoUpdateConfig;

  factory LibraryAutoUpdateConfig.fromJson(Map<String, dynamic> json) =>
      _$LibraryAutoUpdateConfigFromJson(json);
}
