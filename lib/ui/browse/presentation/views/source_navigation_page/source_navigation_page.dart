import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/mobile_tab_bar.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/search_anime_tab.dart';
import 'package:animebox/ui/widgets/navigation_builder.dart';
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

class _SourceNavigationPageState extends ConsumerState<SourceNavigationPage>
    with _SourceNavigationPageController {
  @override
  void initState() {
    super.initState();

    _sentQuery = widget.params.query ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final translations = ref.watch(i18nProvider);
    final source = widget.params.source;

    final sourcesNavigationPageTranslations =
        translations.browsePage.sources.navigation;

    return NavigationBuilder(
      onDestinationChangeAction: _disableSearch,
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
                        onChanged: _trackEmptyQuery,
                        onSubmitted: _submitQuery,
                      )
                    : Text(source.prettyName),
                actions: [
                  if (!_searching)
                    IconButton(
                      onPressed: _enableSearch,
                      icon: const Icon(Icons.search_outlined),
                    ),
                ],
              ),
              body: SourceNavigationPageView(
                currentPage: _actualPage,
                onNavigate: _navigateToPage,
                translations: translations,
                activeTab: child,
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
}

class SourceNavigationPageView extends StatefulWidget {
  final Translations translations;
  final Widget activeTab;

  final Function(SourceNavigationPages page) onNavigate;
  final SourceNavigationPages? currentPage;

  const SourceNavigationPageView({
    super.key,
    required this.onNavigate,
    required this.translations,
    required this.activeTab,
    this.currentPage,
  });

  @override
  State<SourceNavigationPageView> createState() =>
      _SourceNavigationPageViewState();
}

class _SourceNavigationPageViewState extends State<SourceNavigationPageView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (!isDesktopWidth(context))
            SourceNavigationPageMobileTabBar(
              translations: widget.translations,
              currentPage: widget.currentPage,
              onNavigate: widget.onNavigate,
            ),

          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              switchInCurve: _tabChangeCurve,
              switchOutCurve: _tabChangeCurve,
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),

              child: widget.activeTab,
            ),
          ),
        ],
      ),
    );
  }
}

Curve get _tabChangeCurve => Curves.easeInOut;

mixin _SourceNavigationPageController on ConsumerState<SourceNavigationPage> {
  SourceNavigationPages? _actualPage = .popular;
  bool _searching = false;
  late String _sentQuery;

  void _disableSearch() => setState(() {
    _searching = false;
    _sentQuery = "";
  });

  void _enableSearch() => setState(() {
    _searching = true;
    _actualPage = null;
  });

  void _submitQuery(String query) => setState(() {
    _sentQuery = query;
    FocusManager.instance.primaryFocus?.unfocus();
  });

  void _trackEmptyQuery(String query) {
    if (query.isEmpty) {
      setState(() {
        _sentQuery = "";
      });
    }
  }

  void _navigateToPage(SourceNavigationPages page) => setState(() {
    _actualPage = page;
    _disableSearch();
  });
}

enum SourceNavigationPages { popular, latest }
