import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/settings/presentation/views/server_settings/server_details/server_delete_dialog.dart';
import 'package:animebox/features/settings/presentation/views/server_settings/server_details/source_details_dialog.dart';
import 'package:flutter/material.dart';

class ServerDetailsPage extends StatelessWidget {
  const ServerDetailsPage({super.key, required this.server});
  final Server server;

  @override
  Widget build(BuildContext context) {
    final lowHeight = MediaQuery.of(context).size.height < 520;

    return Scaffold(
      appBar: AppBar(title: Text(server.name ?? server.uuid)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: .only(top: (lowHeight) ? 10 : 160)),
              SizedBox(
                width: 120,
                child: (server.logoUrl != null)
                    ? Image.network(server.logoUrl!)
                    : null,
              ),
              const SizedBox(height: 40, width: 40),
              SelectableText(
                server.name ?? server.uuid,
                style: const TextStyle(fontSize: 30, fontWeight: .w700),
                textAlign: .center,
              ),

              if (server.name != null)
                SelectableText(
                  server.uuid,
                  style: const TextStyle(fontSize: 14, fontWeight: .w400),
                  textAlign: .center,
                ),

              const SizedBox(height: 2),
              SelectableText(
                "API Url: ${server.url.toString()}${server.api}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              SelectableText(
                "Version: ${server.schemaVersion}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 40, width: 40),
              Padding(
                padding: const .symmetric(horizontal: 10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: ExpansionTile(
                    title: const Text("Anime sources"),
                    subtitle: Text(
                      switch (server.supportedAnimeSources.length) {
                        0 => "This server has no sources",
                        1 => "This server has 1 source",
                        _ =>
                          "This server has ${server.supportedAnimeSources.length} sources",
                      },
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    children: [
                      for (final source in server.supportedAnimeSources)
                        Card.filled(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHigh,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) =>
                                    SourceDetailsDialog(source: source),
                              ),
                              child: Padding(
                                padding: const .symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(source.prettyName),
                                        Text(
                                          "Identifier: ${source.id}",
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Expanded(child: SizedBox.shrink()),
                                    const Icon(Icons.chevron_right),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Padding(
          padding: const .symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              FilledButton.tonal(
                onPressed: () async {
                  final response = await showDialog<bool>(
                    context: context,
                    builder: (context) => const ServerDeleteDialog(),
                  );

                  if (response == true && context.mounted) {
                    Navigator.of(context).pop(true);
                  }
                },
                child: const Text("Delete this server"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
