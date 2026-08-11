import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/browse/presentation/views/source_navigation_page/app_bar.dart';
import 'package:animebox/features/browse/presentation/views/source_navigation_page/latest_anime_tab.dart';
import 'package:animebox/features/browse/presentation/views/source_navigation_page/popular_anime_tab.dart';
import 'package:flutter/material.dart';

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
  final _tabs = const [
    Tab(text: "Popular", icon: Icon(Icons.favorite)),
    Tab(text: "Latest", icon: Icon(Icons.new_releases)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sourceNavigationPageAppBar(context, widget.source),
      body: Center(
        child: DefaultTabController(
          length: _tabs.length,
          child: Column(
            children: [
              TabBar(tabs: _tabs),
              Expanded(
                child: TabBarView(
                  children: [
                    PopularAnimeTab(
                      source: widget.source,
                      schemaVersion: widget.schemaVersion,
                    ),
                    LatestAnimeTab(
                      source: widget.source,
                      schemaVersion: widget.schemaVersion,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
