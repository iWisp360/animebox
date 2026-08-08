import 'package:freezed_annotation/freezed_annotation.dart';

part 'servers.g.dart';
part 'servers.freezed.dart';

@freezed
abstract class ServersConfig with _$ServersConfig {
  const factory ServersConfig() = _ServersConfig;

  factory ServersConfig.fromJson(Map<String, dynamic> json) =>
      _$ServersConfigFromJson(json);
}
