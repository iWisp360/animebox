import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:flutter/material.dart';

class LatestAnimeTab extends StatelessWidget {
  final AnimeSource source;
  final int schemaVersion;
  const LatestAnimeTab({
    super.key,
    required this.source,
    required this.schemaVersion,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
