import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/series/data/datasources/serie.dart';
import 'package:animebox/features/series/domain/entities/serie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serieSourceProvider = Provider((ref) => SerieSourceRemote());

final serieProvider = FutureProvider.autoDispose
    .family<Serie, (String serieUrl, Server server, String sourceId)>((
      ref,
      params,
    ) async {
      final (serieUrl, server, sourceId) = params;
      final serieSource = ref.read(serieSourceProvider);

      return await serieSource.getSerie(
        url: serieUrl,
        server: server,
        sourceId: sourceId,
      );
    });
