import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/search_anime_tab.dart';
import 'package:animebox/ui/widgets/filter_chip_color.dart';
import 'package:animebox/ui/widgets/navigation_builder.dart';
import 'package:animebox/ui/widgets/tab_view/tab_bar_container.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/latest_anime_tab.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/popular_anime_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceNavigationPageParams {
  final Server server;
  final AnimeSource source;
  final String? query;

  const SourceNavigationPageParams({
    required this.server,
    required this.source,
    this.query,
  });
}

// The styling for this page was inspired by Aniyomi
class SourceNavigationPage extends ConsumerStatefulWidget {
  final SourceNavigationPageParams params;

  const SourceNavigationPage({super.key, required this.params});

  @override
  ConsumerState<SourceNavigationPage> createState() =>
      _SourceNavigationPageState();
}

class _SourceNavigationPageState extends ConsumerState<SourceNavigationPage> {
  SourceNavigationPages? _actualPage = .popular;
  bool _searching = false;
  late final TextEditingController _textEditingController;
  late String _sentQuery;

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    _sentQuery = widget.params.query ?? "";
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chipBackgroundColor = filterChipColor(ref, context);

    final translations = ref.watch(i18nProvider);
    final source = widget.params.source;

    final sourcesNavigationPageTranslations =
        translations.browsePage.sources.navigation;

    return NavigationBuilder(
      onDestinationChangeAction: () => setState(_disableSearch),
      builder: (navigationWidget, child) => Row(
        children: [
          ?navigationWidget,
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: _searching
                    ? TextField(
                        decoration: InputDecoration(
                          border: .none,
                          hintText: "Search on ${source.prettyName}...",
                        ),
                        onChanged: (query) {
                          setState(() {
                            if (query.isEmpty) {
                              _sentQuery = "";
                            }
                          });
                        },
                        onSubmitted: (query) => setState(() {
                          _sentQuery = query;
                          FocusManager.instance.primaryFocus?.unfocus();
                        }),
                      )
                    : Text(source.prettyName),
                actions: [
                  if (!_searching)
                    IconButton(
                      onPressed: () => setState(() {
                        _searching = true;
                        _actualPage = null;
                      }),
                      icon: const Icon(Icons.search_outlined),
                    ),
                ],
              ),
              body: _page(
                activeTab: child,
                chipBackgroundColor: chipBackgroundColor,
                translations: translations,
              ),
            ),
          ),
        ],
      ),
      tabs: [
        PopularAnimeTab(
          source: widget.params.source,
          server: widget.params.server,
        ),
        LatestAnimeTab(
          source: widget.params.source,
          server: widget.params.server,
        ),
      ],
      useNoIndexTab: _searching,
      noIndexTab: SearchAnimeTab(
        query: _sentQuery,
        source: widget.params.source,
        server: widget.params.server,
      ),

      useNavBar: false,
      navRailDestinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.favorite_outlined),
          label: Text(sourcesNavigationPageTranslations.popularAnimes),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.update_outlined),
          label: Text(sourcesNavigationPageTranslations.latestAnimes),
        ),
      ],
    );
  }

  Widget _page({
    required Translations translations,
    required Color chipBackgroundColor,
    required Widget activeTab,
  }) {
    final sourcesNavigationPageTranslations =
        translations.browsePage.sources.navigation;

    return Center(
      child: Column(
        children: [
          if (!isDesktopWidth(context))
            TabBarContainer(
              child: Padding(
                padding: const .symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 10,
                  children: [
                    FilterChip(
                      backgroundColor: chipBackgroundColor,
                      showCheckmark: false,
                      avatar: const Icon(Icons.favorite_outlined),
                      label: Text(
                        sourcesNavigationPageTranslations.popularAnimes,
                      ),
                      selected: _actualPage == .popular,
                      onSelected: (selected) => setState(() {
                        _actualPage = .popular;
                        _disableSearch();
                      }),
                    ),
                    FilterChip(
                      backgroundColor: chipBackgroundColor,
                      showCheckmark: false,
                      avatar: const Icon(Icons.update_outlined),
                      label: Text(
                        sourcesNavigationPageTranslations.latestAnimes,
                      ),
                      selected: _actualPage == .latest,
                      onSelected: (selected) => setState(() {
                        _actualPage = .latest;
                        _disableSearch();
                      }),
                    ),
                  ],
                ),
              ),
            ),

          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              switchInCurve: _tabChangeCurve,
              switchOutCurve: _tabChangeCurve,
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),

              child: activeTab,
            ),
          ),
        ],
      ),
    );
  }

  void _disableSearch() => setState(() {
    _searching = false;
    _sentQuery = "";
  });

  Curve get _tabChangeCurve => Curves.easeInOut;
}

enum SourceNavigationPages { popular, latest }
