import 'package:animebox/ui/local_animes_filter/presentation/views/filter_page_view.dart';
import 'package:animebox/ui/main_page/presentation/views/app_bar.dart';
import 'package:flutter/material.dart';

class MainPageScaffold extends StatelessWidget {
  final bool isOnBrowsePage;
  final bool filtering;
  final Function(bool) filteringSetter;
  final Widget? navigationWidget;
  final Widget activeTab;
  final bool isDesktop;

  const MainPageScaffold({
    super.key,
    required this.filtering,
    required this.isOnBrowsePage,
    required this.isDesktop,
    required this.filteringSetter,
    this.navigationWidget,
    required this.activeTab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: !filtering,
      appBar: (isOnBrowsePage)
          ? null
          : AppBar(
              title: filtering ? null : const Text("Anime Box"),
              leading: filtering
                  ? IconButton(
                      onPressed: () => filteringSetter(false),
                      icon: const Icon(Icons.arrow_back),
                    )
                  : null,
              actions: homeAppBarActions(
                isFiltering: filtering,
                showSettingsAction: !isDesktop,
                filterSetter: (value) => filteringSetter(true),
                isOnSearchTab: false,
                context,
              ),
            ),
      body: (filtering) ? const FilterPageView() : activeTab,
      bottomNavigationBar: (!isDesktop) ? navigationWidget : null,
    );
  }
}
