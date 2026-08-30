import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/search/data/providers/search_provider.dart';
import 'package:animebox/features/search/domain/entities/search.dart';
import 'package:animebox/ui/browse/presentation/views/missing_url_dialog.dart';
import 'package:animebox/ui/serie/presentation/serie_page.dart';
import 'package:animebox/ui/widgets/anime_card.dart';
import 'package:animebox/ui/widgets/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchAnimeTab extends ConsumerWidget with _SearchAnimeTabHelpers {
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

    Future<void> refreshSearch() async =>
        ref.invalidate(provider, asReload: true);

    if (query.isNotEmpty) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: searchResults.when(
          data: (results) => Align(
            alignment: .topCenter,
            child: RefreshIndicator(
              onRefresh: refreshSearch,
              child: Padding(
                padding: calculatePadding(context),
                child: results.results.isEmpty
                    ? const PageInformation(
                        message: "No results found",
                        spritesKind: .errorSprite,
                      )
                    : GridView.count(
                        crossAxisSpacing: gridCrossAxisSpacing,
                        crossAxisCount: calculateGridCrossAxisCount(context),
                        childAspectRatio: gridElementAspectRatio,

                        children: [
                          for (final result in results.results)
                            AnimeCard(
                              name: result.name ?? "No Name",
                              image: result.image,
                              url: result.url,

                              onClick: () => onClickAnimeCard(
                                context: context,
                                result: result,
                                server: server,
                                source: source,
                              ),
                            ),
                        ],
                      ),
              ),
            ),
          ),
          error: (_, _) => PageInformation(
            message: "The Search failed",
            spritesKind: .errorSprite,
            customAction: FilledButton(
              onPressed: refreshSearch,
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

mixin _SearchAnimeTabHelpers {
  EdgeInsetsGeometry calculatePadding(BuildContext context) =>
      calculateDefaultPadding(
        context,
        maxWidth: 1100,
      ).add(const .symmetric(horizontal: 10));

  int calculateGridCrossAxisCount(BuildContext context) =>
      switch (MediaQuery.of(context).size.width) {
        <= 500 => 2,
        <= 800 => 3,
        <= 1000 => 4,
        _ => 5,
      };

  double get gridElementAspectRatio => 9 / 16;
  double get gridCrossAxisSpacing => 5;

  Future<void> onClickAnimeCard({
    required BuildContext context,
    required SearchResults result,
    required Server server,
    required AnimeSource source,
  }) async => (result.url == null)
      ? await showDialog(
          context: context,
          builder: (context) => const MissingUrlDialog(),
        )
      : context.push(
          "/serie",
          extra: SeriePageParams(
            serieUrl: result.url!,
            server: server,
            source: source,
            placeholderImage: result.image,
          ),
        );
}
