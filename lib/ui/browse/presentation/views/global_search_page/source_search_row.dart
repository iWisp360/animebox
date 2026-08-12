import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Center(child: CircularProgressIndicator());
  }
}
