import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/series/data/providers/serie_provider.dart';
import 'package:animebox/ui/widgets/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriePageParams {
  final String serieUrl;
  final Server server;
  final String sourceId;

  const SeriePageParams({
    required this.serieUrl,
    required this.server,
    required this.sourceId,
  });
}

class SeriePage extends ConsumerWidget {
  final SeriePageParams params;
  const SeriePage({super.key, required this.params});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SeriePageParams(:serieUrl, :server, :sourceId) = params;
    final provider = serieProvider((serieUrl, server, sourceId));
    final serieQuery = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: serieQuery.maybeWhen(
          orElse: () => null,
          data: (serie) => (serie.name == null) ? null : Text(serie.name!),
        ),
      ),
      body: serieQuery.when(
        data: (serie) => const Center(),
        error: (_, _) => PageInformation(
          message: "This serie failed to load",
          spritesKind: .errorSprite,
          customAction: FilledButton(
            onPressed: () => ref.invalidate(provider, asReload: true),
            child: const Text("Try Again"),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
