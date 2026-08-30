import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:flutter/material.dart';

class PopularAnimeTab extends StatelessWidget {
  final AnimeSource source;
  final Server server;
  const PopularAnimeTab({
    super.key,
    required this.source,
    required this.server,
  });

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
