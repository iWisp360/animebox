import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/ui/browse/presentation/views/source_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceSelectorBuilder extends ConsumerStatefulWidget {
  final List<Server> servers;
  const SourceSelectorBuilder({super.key, required this.servers});

  @override
  ConsumerState<SourceSelectorBuilder> createState() =>
      _SourceSelectorBuilderState();
}

class _SourceSelectorBuilderState extends ConsumerState<SourceSelectorBuilder>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.servers.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animeBoxConfig = ref.watch(configProvider);

    return animeBoxConfig.maybeWhen(
      orElse: () => const Center(child: CircularProgressIndicator()),
      data: (config) => Material(
        color: Colors.transparent,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: .center,
              controller: _tabController,
              tabs: [
                for (final server in widget.servers)
                  Tab(text: server.name ?? server.uuid),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  for (final server in widget.servers)
                    SourceSelector(
                      serversConfig: config.servers,
                      server: server,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
