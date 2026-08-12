import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/widgets/tab_view/tab_bar_container.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/latest_anime_tab.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/popular_anime_tab.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/app_bar.dart';
import 'package:flutter/material.dart';

// The styling for this page was inspired by Aniyomi
class SourceNavigationPage extends StatefulWidget {
  final int schemaVersion;
  final AnimeSource source;
  const SourceNavigationPage({
    super.key,
    required this.source,
    required this.schemaVersion,
  });

  @override
  State<SourceNavigationPage> createState() => _SourceNavigationPageState();
}

class _SourceNavigationPageState extends State<SourceNavigationPage> {
  SourceNavigationPages _actualPage = .popular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sourceNavigationPageAppBar(context, widget.source),
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
                      label: const Text("Popular"),
                      selected: _actualPage == .popular,
                      onSelected: (selected) => setState(() {
                        _actualPage = .popular;
                      }),
                    ),
                    FilterChip(
                      showCheckmark: false,
                      avatar: const Icon(Icons.update),
                      label: const Text("Latest"),
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
                  source: widget.source,
                  schemaVersion: widget.schemaVersion,
                ),
                .latest => LatestAnimeTab(
                  source: widget.source,
                  schemaVersion: widget.schemaVersion,
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
