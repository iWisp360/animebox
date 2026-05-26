import 'dart:ui';

import 'package:animebox/core/config.dart';
import 'package:animebox/main.dart';
import 'package:animebox/src/rust/api/data/metadata/utils.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MetadataPage extends StatefulWidget {
  const MetadataPage({super.key});

  @override
  State<MetadataPage> createState() => _MetadataPageState();
}

class _MetadataPageState extends State<MetadataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.metadataSettingsHeader),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("Metadata Sources"),
            tiles: [
              CustomSettingsTile(
                child: Card(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  child: const Column(
                    children: [
                      Padding(padding: EdgeInsetsGeometry.only(top: 10)),
                      SourceSelector(),
                      Padding(padding: EdgeInsetsGeometry.only(bottom: 10)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const metadataSourceName = {
  MetadataSources.myAnimeList: "MyAnimeList",
  MetadataSources.aniList: "AniList",
};

class SourceSelector extends StatefulWidget {
  const SourceSelector({super.key});

  @override
  State<SourceSelector> createState() => _SourceSelectorState();
}

class _SourceSelectorState extends State<SourceSelector> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      proxyDecorator: (child, index, animation) {
        final double animValue = Curves.easeInOut.transform(animation.value);

        final double elevation = lerpDouble(0, 6, animValue)!;

        return Material(
          elevation: elevation,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: child,
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < config.metadata.preferredMetaSources.length; i++)
          Row(
            key: ValueKey(config.metadata.preferredMetaSources[i].source),
            children: [
              Checkbox(
                value: config.metadata.preferredMetaSources[i].enabled,
                onChanged: (value) => setState(() {
                  config.metadata.preferredMetaSources[i].enabled =
                      value ?? false;
                  config.update();
                }),
              ),
              Text(
                metadataSourceName[config
                    .metadata
                    .preferredMetaSources[i]
                    .source]!,
              ),
              const Spacer(),
              ReorderableDragStartListener(
                index: i,
                child: const Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Icon(Icons.drag_handle),
                ),
              ),
            ],
          ),
      ],
      onReorder: (oldIndex, newIndex) => setState(() {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }

        final item = config.metadata.preferredMetaSources.removeAt(oldIndex);
        config.metadata.preferredMetaSources.insert(newIndex, item);

        config.update();
      }),
    );
  }
}
