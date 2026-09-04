import 'package:animebox/core/servers/exceptions.dart';
import 'package:animebox/core/servers/presentation/providers/server_provider.dart';
import 'package:animebox/features/series/data/datasources/serie.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anime_serie.g.dart';

@Riverpod(keepAlive: true)
SerieSource serieSource(Ref ref) => SerieSourceRemote();

@Riverpod(keepAlive: true)
Future<Serie> animeSerie(
  Ref ref, {
  required String serieUrl,
  required String serverUuid,
  required String sourceId,
  String? altImage,
}) async {
  final server = await ref.read(serverProvider(serverUuid).future);

  if (server == null) throw ServersNotInitializedException();
  final serieSource = ref.read(serieSourceProvider);

  return (await serieSource.getSerie(
    url: serieUrl,
    server: server,
    sourceId: sourceId,
  )).copyWith(altImage: altImage);
}
