import 'package:animebox/core/configs/presentation/views/config_builder.dart';
import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/l10n/context.dart';
import 'package:animebox/features/browse/presentation/views/browse_page_view.dart';
import 'package:animebox/features/home/presentation/views/home_page_view.dart';
import 'package:animebox/features/library/presentation/views/library_page_view.dart';
import 'package:animebox/features/localAnimesFilter/presentation/views/filter_page_view.dart';
import 'package:animebox/features/mainPage/presentation/controllers/main_page_controller.dart';
import 'package:animebox/features/mainPage/presentation/views/app_bar.dart';
import 'package:animebox/features/mainPage/presentation/views/navigation.dart';
import 'package:animebox/features/settings/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget {
  final MainPageController mainPageController;
  const MainPageView({super.key, MainPageController? mainPageController})
    : mainPageController = mainPageController ?? const MainPageControllerImpl();

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  bool filtering = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDesktopWidth(context);

    final destinations = [
      (
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: context.l10n.homePageLabelNavigation,
      ),
      (
        icon: const Icon(Icons.video_library_outlined),
        selectedIcon: const Icon(Icons.video_library),
        label: context.l10n.libraryPageLabelNavigation,
      ),
      (
        icon: const Icon(Icons.explore_outlined),
        selectedIcon: const Icon(Icons.explore),
        label: context.l10n.browsePageLabelNavigation,
      ),
    ];

    return ConfigBuilder(
      builder: (controller, context) => PopScope(
        onPopInvokedWithResult: (didPop, result) =>
            setState(() => filtering = false),

        canPop: !filtering,
        child: NavigationBuilder(
          onDestinationChangeAction: () => setState(() => filtering = false),
          builder: (navigationWidget, activeTab) {
            final scaffold = Scaffold(
              drawerEnableOpenDragGesture: !filtering,
              appBar: AppBar(
                title: filtering ? null : const Text("Anime Box"),
                leading: filtering
                    ? IconButton(
                        onPressed: () => setState(() => filtering = false),
                        icon: const Icon(Icons.arrow_back),
                      )
                    : null,
                actions: homeAppBarActions(
                  isFiltering: filtering,
                  showSettingsAction: !isDesktop,
                  filterSetter: (value) => setState(() => filtering = value),
                  isOnSearchTab: false,
                  context,
                ),
              ),
              body: (filtering) ? const FilterPageView() : activeTab,
              bottomNavigationBar: (!isDesktop) ? navigationWidget : null,
            );

            if (isDesktop) {
              return Row(
                children: [
                  navigationWidget,
                  Expanded(child: scaffold),
                ],
              );
            } else {
              return scaffold;
            }
          },

          tabs: const [HomePageView(), LibraryPageView(), BrowsePageView()],
          navRailDestinations: [
            for (final dest in destinations)
              NavigationRailDestination(
                icon: dest.icon,
                selectedIcon: dest.selectedIcon,
                label: Text(dest.label),
              ),
          ],

          leadingRailAction: Padding(
            padding: const .symmetric(vertical: 10),
            child: Image.asset("assets/placeholder_icon.png", width: 40),
          ),

          trailingRailAction: FloatingActionButton(
            tooltip: context.l10n.settingsPageHeader,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            ),
            child: const Icon(Icons.settings),
          ),

          navBarDestinations: [
            for (final dest in destinations)
              NavigationDestination(
                icon: dest.icon,
                selectedIcon: dest.selectedIcon,
                label: dest.label,
              ),
          ],
        ),
      ),
    );
  }
}
