import 'package:animebox/core/schema/domain/entities/agnostic_server_info.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';

abstract class ServerInfoMapper {
  Server mapFromSchema(AgnosticServerInfo serverInfo);
}
