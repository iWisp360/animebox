import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/ui/browse/views/source_navigation_page/source_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SourceSpecificSearchButton extends StatelessWidget {
  final String query;
  final AnimeSource source;
  final Server server;

  const SourceSpecificSearchButton({
    super.key,
    required this.query,
    required this.source,
    required this.server,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push(
          "/navigateSource",
          extra: SourceNavigationPageParams(
            server: server,
            source: source,
            query: query,
          ),
        ),
        child: Padding(
          padding: const .symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Text(
                source.prettyName,
                style: const TextStyle(fontWeight: .w700, fontSize: 16),
              ),
              const Expanded(child: SizedBox()),
              const Icon(Icons.chevron_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
