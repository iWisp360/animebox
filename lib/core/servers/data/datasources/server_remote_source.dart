import 'dart:convert';

import 'package:animebox/core/json.dart';
import 'package:animebox/core/schema/data/repositories/server_info_mapper_impl.dart';
import 'package:animebox/core/schema/domain/entities/agnostic_server_info.dart';
import 'package:animebox/core/schema/domain/repositories/server_info_mapper.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart';

abstract class ServerRemoteSource {
  Future<Server> getFromEndpoint(String url, bool enableHentai);
}

class ServerRemoteSourceImpl implements ServerRemoteSource {
  final ServerInfoMapper serverInfoMapper;

  const ServerRemoteSourceImpl({ServerInfoMapper? serverInfoMapper})
    : serverInfoMapper = serverInfoMapper ?? const ServerInfoMapperImpl();

  @override
  Future<Server> getFromEndpoint(String url, bool enableHentai) async {
    try {
      final parsedUrl = Uri.parse(url);
      final responseBodyUnparsed = (await get(parsedUrl)).bodyBytes;
      final responseBody = utf8.decode(responseBodyUnparsed);

      final serverInfo =
          jsonDecoder().convert(responseBody) as Map<String, dynamic>;

      final server = AgnosticServerInfo.fromJson(serverInfo);

      final storedUrl = Uri.parse(
        "${parsedUrl.scheme.isEmpty ? "" : "${parsedUrl.scheme}://"}${parsedUrl.authority}",
      );

      Server parsedServer = serverInfoMapper.mapFromSchema(server);

      if (!enableHentai) {
        final sources = parsedServer.supportedAnimeSources.map((s) {
          final source = s.isHentaiSource && !s.toggledManually
              ? s.copyWith(enabled: false)
              : s;
          return source;
        }).toList();

        parsedServer = parsedServer.copyWith(supportedAnimeSources: sources);
      }

      return parsedServer.copyWith(
        url: storedUrl,
        infoEndpoint: parsedUrl.path,
        supportedAnimeSources: parsedServer.supportedAnimeSources.sorted(
          (a, b) => a.prettyName.compareTo(b.prettyName),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  static const serverInfoGraphqlQuery = """
    query {
      ServerInfo {
        name
        developer
        uuid
        version
        minCompat
        supportedAnimeSources {
          prettyName
          id
          noMetaProvider
          recommendations
          isHentaiSource
          lang
        }
        logoUrl
      }
    }
  """;
}
