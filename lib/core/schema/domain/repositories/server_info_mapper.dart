import 'package:animebox/core/schema/domain/entities/agnostic_wrapper.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';

abstract class ServerInfoMapper {
  Server mapFromSchema(AgnosticWrapper serverInfo);
}
