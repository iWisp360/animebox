import 'package:freezed_annotation/freezed_annotation.dart';

part 'agnostic_wrapper.g.dart';
part 'agnostic_wrapper.freezed.dart';

@freezed
abstract class AgnosticWrapper with _$AgnosticWrapper {
  const factory AgnosticWrapper({
    required int schemaVersion,
    required Map<String, dynamic> info,
  }) = _AgnosticWrapper;

  factory AgnosticWrapper.fromJson(Map<String, dynamic> json) =>
      _$AgnosticWrapperFromJson(json);
}
