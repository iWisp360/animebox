import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/search/data/providers/search_provider.dart';
import 'package:animebox/ui/browse/presentation/views/missing_url_dialog.dart';
import 'package:animebox/ui/serie/presentation/serie_page.dart';
import 'package:animebox/ui/widgets/anime_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SourceSearchRow extends ConsumerWidget {
  final Server server;
  final AnimeSource source;
  final String query;

  const SourceSearchRow({
    super.key,
    required this.server,
    required this.source,
    required this.query,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider((query, server, source.id)));

    return Column(
      spacing: 5,
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: Text(
            source.prettyName,
            style: const TextStyle(fontWeight: .w700, fontSize: 16),
          ),
        ),
        search.when(
          loading: () => paddingLoadingError(
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          data: (search) {
            if (search.results.isNotEmpty) {
              return SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 8,
                  mainAxisSize: .max,
                  crossAxisAlignment: .start,
                  children: [
                    const SizedBox(width: 1),
                    for (final result in search.results)
                      if (result.url != null || result.name != null)
                        AnimeCard(
                          url: result.url,
                          name: result.name ?? result.url!,
                          image: result.image,
                          onClick: () async {
                            if (result.url == null) {
                              await showDialog(
                                context: context,
                                builder: (context) => const MissingUrlDialog(),
                              );
                            } else {
                              context.push(
                                "/serie",
                                extra: SeriePageParams(
                                  serieUrl: result.url!,
                                  server: server,
                                  source: source,
                                  placeholderImage: result.image,
                                ),
                              );
                            }
                          },
                        ),
                  ],
                ),
              );
            } else {
              return paddingLoadingError(
                child: const Center(child: Text("No Results")),
              );
            }
          },
          error: (e, st) => paddingLoadingError(
            child: Center(
              child: Text(
                e.toString(),
                textAlign: .center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget paddingLoadingError({required Widget child}) =>
      Padding(padding: const .symmetric(vertical: 5), child: child);
}
