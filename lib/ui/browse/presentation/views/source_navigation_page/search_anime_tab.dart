import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/search/data/providers/search_provider.dart';
import 'package:animebox/ui/browse/presentation/views/missing_url_dialog.dart';
import 'package:animebox/ui/serie/presentation/serie_page.dart';
import 'package:animebox/ui/widgets/anime_card.dart';
import 'package:animebox/ui/widgets/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchAnimeTab extends ConsumerWidget {
  final String query;
  final AnimeSource source;
  final Server server;
  const SearchAnimeTab({
    super.key,
    required this.query,
    required this.source,
    required this.server,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = searchProvider((query, server, source.id));
    final searchResults = ref.watch(provider);

    if (query.isNotEmpty) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: searchResults.when(
          data: (results) => Align(
            alignment: .topCenter,
            child: SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async => ref.invalidate(provider, asReload: true),
                child: Padding(
                  padding: calculateDefaultPadding(
                    context,
                    maxWidth: 1100,
                  ).add(const .symmetric(horizontal: 10)),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 5,
                    crossAxisCount: switch (MediaQuery.of(context).size.width) {
                      <= 500 => 2,
                      <= 800 => 3,
                      <= 1000 => 4,
                      _ => 5,
                    },
                    childAspectRatio: 9 / 16,

                    children: [
                      for (final result in results.results)
                        AnimeCard(
                          name: result.name ?? "No Name",
                          image: result.image,
                          url: result.url,

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
                ),
              ),
            ),
          ),
          error: (_, _) => PageInformation(
            message: "The Search failed",
            customAction: FilledButton(
              onPressed: () => ref.invalidate(provider, asReload: true),
              child: const Text("Try Again"),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      );
    } else {
      return const Center();
    }
  }
}
