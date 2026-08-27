import 'package:animebox/core/configs/domain/entities/servers.dart';
import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/ui/browse/presentation/views/clickable_source.dart';
import 'package:flutter/material.dart';

class SourceSelector extends StatelessWidget {
  final List<AnimeSource> sources;
  final String serverUuid;
  final int schemaVersion;
  final ServersConfig serversConfig;
  const SourceSelector({
    super.key,
    required this.sources,
    required this.schemaVersion,
    required this.serverUuid,
    required this.serversConfig,
  });

  @override
  Widget build(BuildContext context) {
    final enabledSources = [];
    final disabledSources = [];

    for (final source in sources) {
      final clickableSource = ClickableSource(
        source: source,
        serversConfig: serversConfig,
        serverUuid: serverUuid,
        schemaVersion: schemaVersion,
      );

      if (source.enabled) {
        enabledSources.add(clickableSource);
      } else {
        disabledSources.add(clickableSource);
      }
    }

    return Padding(
      padding: calculateDefaultPadding(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            if (enabledSources.isNotEmpty)
              const Padding(
                padding: .symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Sources",
                  style: TextStyle(fontSize: 16, fontWeight: .w600),
                ),
              ),
            ...enabledSources,
            ExpansionTile(
              title: const Text(
                "Disabled",
                style: TextStyle(fontSize: 16, fontWeight: .w600),
              ),
              children: [...disabledSources],
            ),
          ],
        ),
      ),
    );
  }
}
