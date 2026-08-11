import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/features/browse/presentation/views/source_selector.dart';
import 'package:flutter/material.dart';

class SourceSelectorBuilder extends StatefulWidget {
  final List<Server> servers;
  const SourceSelectorBuilder({super.key, required this.servers});

  @override
  State<SourceSelectorBuilder> createState() => _SourceSelectorBuilderState();
}

class _SourceSelectorBuilderState extends State<SourceSelectorBuilder>
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
    return Material(
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
                    sources: server.supportedAnimeSources,
                    schemaVersion: server.schemaVersion,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
