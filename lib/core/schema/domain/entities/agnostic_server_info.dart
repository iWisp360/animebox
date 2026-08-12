import 'package:freezed_annotation/freezed_annotation.dart';

part 'agnostic_server_info.g.dart';
part 'agnostic_server_info.freezed.dart';

@freezed
abstract class AgnosticServerInfo with _$AgnosticServerInfo {
  const factory AgnosticServerInfo({
    required int schemaVersion,
    required Map<String, dynamic> info,
  }) = _AgnosticServerInfo;

  factory AgnosticServerInfo.fromJson(Map<String, dynamic> json) =>
      _$AgnosticServerInfoFromJson(json);
}
