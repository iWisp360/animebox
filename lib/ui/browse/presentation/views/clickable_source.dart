import 'package:animebox/core/configs/domain/entities/servers.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/ui/browse/presentation/views/source_disabled_dialog.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/source_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClickableSource extends StatelessWidget {
  final AnimeSource source;
  final String serverUuid;
  final int schemaVersion;
  final ServersConfig serversConfig;
  const ClickableSource({
    super.key,
    required this.source,
    required this.schemaVersion,
    required this.serverUuid,
    required this.serversConfig,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: source.enabled
              ? () => context.go(
                  "/navigateSource",
                  extra: SourceNavigationPageParams(
                    schemaVersion: schemaVersion,
                    source: source,
                  ),
                )
              : () async {
                  final enabled = await showDialog<bool>(
                    context: context,
                    builder: (context) => SourceDisabledDialog(
                      serverUuid: serverUuid,
                      source: source,
                    ),
                  );

                  if (enabled == true &&
                      serversConfig.exploreEnabledSource &&
                      context.mounted) {
                    context.go(
                      "/navigateSource",
                      extra: SourceNavigationPageParams(
                        schemaVersion: schemaVersion,
                        source: source,
                      ),
                    );
                  }
                },
          child: Padding(
            padding: const .symmetric(vertical: 15, horizontal: 15),
            child: Text(
              source.prettyName,
              style: TextStyle(
                color: !source.enabled
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : null,

                fontStyle: !source.enabled ? .italic : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
