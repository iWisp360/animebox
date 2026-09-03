import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/presentation/providers/servers_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'source_provider.g.dart';

@riverpod
Future<AnimeSource?> animeSource(Ref ref, String sourceId) async {
  final servers = await ref.watch(serversListProvider.future);

  for (final server in servers) {
    for (final source in server.supportedAnimeSources) {
      if (source.id == sourceId) return source;
    }
  }

  return null;
}
