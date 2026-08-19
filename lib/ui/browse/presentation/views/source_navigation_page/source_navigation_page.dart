import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/ui/widgets/tab_view/tab_bar_container.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/latest_anime_tab.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/popular_anime_tab.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceNavigationPageParams {
  final int schemaVersion;
  final AnimeSource source;

  const SourceNavigationPageParams({
    required this.schemaVersion,
    required this.source,
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
  SourceNavigationPages _actualPage = .popular;

  @override
  Widget build(BuildContext context) {
    final translations = ref.watch(i18nProvider);
    final sourcesNavigationPageTranslations =
        translations.browsePage.sources.navigation;

    return Scaffold(
      appBar: sourceNavigationPageAppBar(context, widget.params.source),
      body: Center(
        child: Column(
          children: [
            TabBarContainer(
              child: Padding(
                padding: const .symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 10,
                  children: [
                    FilterChip(
                      showCheckmark: false,
                      avatar: const Icon(Icons.favorite),
                      label: Text(
                        sourcesNavigationPageTranslations.popularAnimes,
                      ),
                      selected: _actualPage == .popular,
                      onSelected: (selected) => setState(() {
                        _actualPage = .popular;
                      }),
                    ),
                    FilterChip(
                      showCheckmark: false,
                      avatar: const Icon(Icons.update),
                      label: Text(
                        sourcesNavigationPageTranslations.latestAnimes,
                      ),
                      selected: _actualPage == .latest,
                      onSelected: (selected) => setState(() {
                        _actualPage = .latest;
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: switch (_actualPage) {
                .popular => PopularAnimeTab(
                  source: widget.params.source,
                  schemaVersion: widget.params.schemaVersion,
                ),
                .latest => LatestAnimeTab(
                  source: widget.params.source,
                  schemaVersion: widget.params.schemaVersion,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum SourceNavigationPages { popular, latest }
