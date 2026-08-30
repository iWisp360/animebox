import 'package:animebox/core/configs/domain/entities/servers.dart';
import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/ui/browse/views/source_disabled_dialog.dart';
import 'package:animebox/ui/browse/views/source_navigation_page/source_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClickableSource extends StatelessWidget {
  final AnimeSource source;
  final Server server;
  final ServersConfig serversConfig;
  const ClickableSource({
    super.key,
    required this.source,
    required this.server,
    required this.serversConfig,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => source.enabled
              ? navigateToSource(context)
              : showDialogDisabledSource(context),
          child: Padding(
            padding: outerPadding,
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

  EdgeInsetsGeometry get outerPadding =>
      const .symmetric(vertical: 15, horizontal: 15);

  void navigateToSource(BuildContext context) => context.go(
    "/navigateSource",
    extra: SourceNavigationPageParams(server: server, source: source),
  );

  Future<void> showDialogDisabledSource(BuildContext context) async {
    final dialogResponse = await showDialog<SourceDisabledDialogResponse>(
      context: context,
      builder: (context) =>
          SourceDisabledDialog(serverUuid: server.uuid, source: source),
    );

    final goToSource =
        ((dialogResponse == .saidYes && serversConfig.exploreEnabledSource) ||
        dialogResponse == .browse);

    if (goToSource && context.mounted) {
      navigateToSource(context);
    }
  }
}
