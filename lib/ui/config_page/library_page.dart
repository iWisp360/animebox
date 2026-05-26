import 'package:animebox/core/config.dart';
import 'package:animebox/main.dart';
import 'package:animebox/ui/config_page/utils.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final autoUpdatesExpansibleController = ExpansibleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(l10n.librarySettingsHeader),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(l10n.categoriesSection),
            tiles: [
              SettingsTile.navigation(
                onPressed: (context) => changeCategoryDialog(),
                title: Text(l10n.defaultCategory),
                value: Text("Currently set to ${config.library_.defCategory}"),
                enabled: config.library_.customCategories.isNotEmpty,
                trailing: TextButton(
                  onPressed: changeCategoryDialog,
                  child: Text(l10n.change),
                ),
              ),
              CustomSettingsTile(
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 8),
                  child: ExpansionTile(
                    shape: const Border(),
                    title: Text(l10n.categoriesSection),
                    subtitle: Text(
                      l10n.categoriesListSubtitle(
                        config.library_.customCategories.length,
                      ),
                    ),
                    children: [
                      Column(
                        children: [
                          for (final category
                              in config.library_.customCategories)
                            Padding(
                              padding: const EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                              ),
                              child: Card.filled(
                                child: ListTile(
                                  leading: Text(
                                    category,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () => setState(() {
                                      if (config.library_.defCategory ==
                                          category) {
                                        config.library_.defCategory = "%home%";
                                      }

                                      config.library_.customCategories.remove(
                                        category,
                                      );

                                      config.update();
                                    }),
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsetsGeometry.symmetric(
                              horizontal: 20,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const AddCategoryDialog(),
                                );
                                setState(() {});
                              },
                              child: Text(l10n.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SettingsSection(
            title: const Text("Update"),
            tiles: [
              SettingsTile.switchTile(
                title: const Text("Auto Updates"),
                description: const Text(
                  "Whether to update series in your library automatically",
                ),

                initialValue: config.library_.updateParams.autoUpdatesEnable,
                onToggle: (value) => setState(() {
                  config.library_.updateParams.autoUpdatesEnable = value;
                  if (!config.library_.updateParams.autoUpdatesEnable) {
                    autoUpdatesExpansibleController.collapse();
                  }

                  config.update();
                }),
              ),

              CustomSettingsTile(
                child: ExpansionTile(
                  enabled: config.library_.updateParams.autoUpdatesEnable,
                  title: const Text("Auto updates behavior"),
                  controller: autoUpdatesExpansibleController,
                  children: [
                    ClickableDropdownMenu(
                      title: const Text("Updates Interval"),
                      description: const Text(
                        "Interval in which updates will be performed automatically",
                      ),
                      value: config.library_.updateParams.autoUpdatesInterval,
                      items: readableIntervalsMenu,
                      onChanged: (value) => setState(() {
                        config.library_.updateParams.autoUpdatesInterval =
                            value ?? 6;

                        config.update();
                      }),
                    ),
                    SettingsTile.switchTile(
                      title: const Text("Allow mobile data"),
                      description: const Text(
                        "Perform updates automatically even if internet is provided by mobile data",
                      ),
                      initialValue:
                          config.library_.updateParams.autoUpdatesMobileData,

                      onToggle: (value) => setState(() {
                        config.library_.updateParams.autoUpdatesMobileData =
                            value;
                        config.update();
                      }),
                    ),

                    SettingsTile.switchTile(
                      title: const Text("Update metadata"),
                      description: const Text(
                        "Update serie metadata automatically as well as chapters",
                      ),
                      initialValue:
                          config.library_.updateParams.checkMetadataToo,

                      onToggle: (value) => setState(() {
                        config.library_.updateParams.checkMetadataToo = value;
                        config.update();
                      }),
                    ),
                    SettingsTile.switchTile(
                      title: const Text("Avoid watched series"),
                      description: const Text(
                        "Whether to ignore watched series",
                      ),
                      initialValue:
                          config.library_.updateParams.avoidWatchedSeries,

                      onToggle: (value) => setState(() {
                        config.library_.updateParams.avoidWatchedSeries = value;
                        config.update();
                      }),
                    ),
                    SettingsTile.switchTile(
                      title: const Text("Avoid completed series"),
                      description: const Text(
                        "Whether to ignore completed series",
                      ),
                      initialValue:
                          config.library_.updateParams.avoidCompletedSeries,

                      onToggle: (value) => setState(() {
                        config.library_.updateParams.avoidCompletedSeries =
                            value;
                        config.update();
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void changeCategoryDialog() async {
    await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(l10n.defaultCategory),
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: TextButton(
              onPressed: () => setState(() {
                changeCategory("%home%", context);
              }),
              child: const Text("Default Home"),
            ),
          ),

          for (var category in config.library_.customCategories)
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () => setState(() {
                  changeCategory(category, context);
                }),
                child: Text(category),
              ),
            ),
        ],
      ),
    );
    setState(() {});
  }
}

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({super.key});

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Add Category"),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              onSubmitted: (category) => setState(() {
                config.library_.customCategories.add(category);
                config.update();
                Navigator.of(context).pop();
              }),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsGeometry.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              Padding(
                padding: const EdgeInsetsGeometry.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    config.library_.customCategories.add(controller.text);
                    config.update();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Confirm"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void changeCategory(String category, BuildContext context) {
  config.library_.defCategory = category;
  config.update();
  Navigator.of(context).pop();
}
