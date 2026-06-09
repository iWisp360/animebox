import 'package:animebox/anime_sources.dart';
import 'package:animebox/core/config.dart';
import 'package:animebox/main.dart';
import 'package:animebox/src/rust/api/data/caching/anime_sources.dart';
import 'package:animebox/src/rust/api/data/models.dart';
import 'package:animebox/src/rust/api/server/handler.dart';
import 'package:animebox/src/rust/api/server/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:settings_ui/settings_ui.dart';

class ServersPage extends StatefulWidget {
  const ServersPage({super.key});

  @override
  State<ServersPage> createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(l10n.serversSettingsHeader),
        ),

        body: ValueListenableBuilder(
          valueListenable: animeSourcesController.isRefreshing,
          builder: (context, isRefreshing, child) => StreamBuilder(
            stream: animeSourcesController.getCurrentRefresh(),
            builder: (context, snapshot) => SettingsList(
              darkTheme: SettingsThemeData(
                settingsListBackground: Theme.of(
                  context,
                ).scaffoldBackgroundColor,
              ),
              sections: [
                SettingsSection(
                  title: const Row(children: [Text("Servers")]),
                  tiles: [
                    ...config.servers.servers.isEmpty
                        ? [
                            const CustomSettingsTile(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    top: 20,
                                    bottom: 30,
                                  ),
                                  child: Text(
                                    "There are no servers yet. Maybe add one?",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ]
                        : [
                            for (final server in config.servers.servers)
                              CustomSettingsTile(
                                child: ServerTile(
                                  server: server,
                                  isBeingRefreshed: isRefreshing,
                                  onDeletion: () => setState(() {
                                    animeSourcesController.cacheManager.sources
                                        .remove(server.uuid);
                                    animeSourcesController.cacheManager
                                        .update();
                                  }),
                                  onTapUndo: () => setState(() {
                                    config.servers.servers.add(server);
                                    config.update();
                                  }),
                                ),
                              ),
                          ],
                    CustomSettingsTile(
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(
                          top: config.servers.servers.isEmpty ? 0 : 10,
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilledButton.tonal(
                              onPressed: () async {
                                final ConfigServer? server;
                                server = await showDialog(
                                  context: context,
                                  builder: (context) => const ServerDialog(),
                                );

                                setState(() {
                                  if (server != null) {
                                    config.servers.servers.add(server);
                                    config.update();
                                  }
                                });
                              },
                              child: const Text("Add Server"),
                            ),

                            FilledButton.tonal(
                              onPressed:
                                  isRefreshing || config.servers.servers.isEmpty
                                  ? null
                                  : () => setState(() {
                                      animeSourcesController.doRefresh(
                                        onlyMissing: false,
                                        forceFetch: true,
                                        context: context,
                                        noFetch: false,
                                      );
                                    }),
                              child: isRefreshing
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text("Refresh all sources"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServerDialog extends StatefulWidget {
  const ServerDialog({super.key});

  @override
  State<ServerDialog> createState() => _ServerDialogState();
}

class _ServerDialogState extends State<ServerDialog> {
  late final TextEditingController textController;
  bool isValid = false;
  String? textError;
  bool isLoadingServer = false;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Server"),
      content: SizedBox(
        width: 400,
        child: TextFormField(
          controller: textController,
          onFieldSubmitted: (input) => (submit(context) ?? () => ())(),
          onChanged: (input) {
            setState(() {
              textError = input.isEmpty ? null : validateUrl(url: input);

              if (textError == null) {
                if (config.servers.servers.any((e) => e.url == input)) {
                  textError = "A server with this url already exists";
                }
              }

              isValid = textError == null && input.isNotEmpty;
            });
          },
          decoration: InputDecoration(
            label: const Text("Server Url"),
            errorMaxLines: 10,
            errorText: textError,
          ),
        ),
      ),
      actions: [
        FilledButton.tonal(
          onPressed: submit(context),
          child: !isLoadingServer
              ? const Text("Add")
              : const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
        ),
        FilledButton.tonal(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text("Cancel"),
        ),
      ],
    );
  }

  Function()? submit(BuildContext context) {
    return isValid
        ? () async {
            try {
              setState(() {
                isLoadingServer = true;
                isValid = false;
              });
              final server = await getServer(url: textController.value.text);
              if (context.mounted) {
                Navigator.of(context).pop(server);
              }
            } catch (e) {
              textError = (e as AnyhowException).message;
            } finally {
              if (mounted) {
                setState(() {
                  isLoadingServer = false;
                });
              }
            }

            return;
          }
        : null;
  }
}

class ServerTile extends StatefulWidget {
  final ConfigServer server;
  final Function() onDeletion;
  final Function() onTapUndo;
  final bool isBeingRefreshed;

  const ServerTile({
    super.key,
    required this.server,
    required this.onDeletion,
    required this.onTapUndo,
    required this.isBeingRefreshed,
  });

  @override
  State<ServerTile> createState() => _ServerTileState();
}

class _ServerTileState extends State<ServerTile> {
  List<AnimeSource>? sources;
  RefreshJob? currentRefreshProgress;

  @override
  void initState() {
    if (animeSourcesController.cacheManager.sources.keys.contains(
      widget.server.uuid,
    )) {
      sources = animeSourcesController.cacheManager.sources[widget.server.uuid];
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ServerTile oldWidget) {
    if (animeSourcesController.cacheManager.sources.keys.contains(
      widget.server.uuid,
    )) {
      sources = animeSourcesController.cacheManager.sources[widget.server.uuid];
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: SettingsTile(
        title: Text(widget.server.name ?? ""),
        leading: widget.server.logoUrl != null
            ? ImageIcon(NetworkImage(widget.server.logoUrl!))
            : null,
        description: Text(
          "Sources: ${(sources != null && sources!.isNotEmpty) ? sources!.length : "Not fetched"}",
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: widget.isBeingRefreshed
                  ? null
                  : () => setState(() {
                      config.servers.servers.remove(widget.server);
                      widget.onDeletion();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          action: SnackBarAction(
                            label: "Undo",
                            onPressed: () => widget.onTapUndo(),
                          ),
                          content: Row(
                            children: [
                              Text(
                                "Deleted server '${widget.server.name ?? ""}'",
                              ),
                            ],
                          ),
                        ),
                      );
                      config.update();
                    }),
              icon: const Icon(Icons.delete),
            ),
            Checkbox(
              value: widget.server.enabled,
              onChanged: widget.isBeingRefreshed
                  ? null
                  : (value) {
                      if (value != null) {
                        setState(() {
                          widget.server.enabled = value;
                          config.update();
                        });
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
