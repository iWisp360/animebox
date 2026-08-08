import 'package:freezed_annotation/freezed_annotation.dart';

part 'library.g.dart';
part 'library.freezed.dart';

@freezed
abstract class LibraryConfig with _$LibraryConfig {
  const factory LibraryConfig() = _LibraryConfig;

  factory LibraryConfig.fromJson(Map<String, dynamic> json) =>
      _$LibraryConfigFromJson(json);
}
