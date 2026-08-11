import 'package:animebox/core/schema/domain/entities/agnostic_wrapper.dart';
import 'package:animebox/core/schema/domain/entities/schema_v1/server_info.dart';
import 'package:animebox/core/schema/domain/repositories/server_info_mapper.dart';
import 'package:animebox/core/schema/exceptions.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';

class ServerInfoMapperImpl implements ServerInfoMapper {
  @override
  Server mapFromSchema(AgnosticWrapper serverInfo) =>
      switch (serverInfo.schemaVersion) {
        1 => handleSchemaV1(serverInfo.info),
        _ => throw UnsupportedSchemaVersionException(
          schemaVersion: serverInfo.schemaVersion,
        ),
      };

  Server handleSchemaV1(Map<String, dynamic> json) {
    final deserializedInfo = ServerInfoV1.fromJson(json);
    final supportedAnimeSources = deserializedInfo.supportedAnimeSources
        .map(
          (source) => AnimeSource(
            prettyName: source.prettyName,
            id: source.id,
            isHentaiSource: source.isHentaiSource,
            noMetaProvider: source.noMetaProvider,
            lang: switch (source.lang) {
              .en => .en,
              .es => .es,
            },
            recommendations: source.recommendations,
          ),
        )
        .toList();

    return Server(
      name: deserializedInfo.name,
      logoUrl: deserializedInfo.logoUrl,
      url: Uri.base,
      uuid: deserializedInfo.uuid,
      api: deserializedInfo.api,
      schemaVersion: 1,
      supportedAnimeSources: supportedAnimeSources,
    );
  }
}
