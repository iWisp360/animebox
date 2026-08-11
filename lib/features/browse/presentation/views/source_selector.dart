import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/features/browse/presentation/views/clickable_source.dart';
import 'package:animebox/features/browse/presentation/views/source_navigation_page/source_navigation_page.dart';
import 'package:flutter/material.dart';

class SourceSelector extends StatelessWidget {
  final List<AnimeSource> sources;
  final int schemaVersion;
  const SourceSelector({
    super.key,
    required this.sources,
    required this.schemaVersion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: calculateDefaultPadding(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final source in sources)
              ClickableSource(
                source: source,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SourceNavigationPage(
                      source: source,
                      schemaVersion: schemaVersion,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
