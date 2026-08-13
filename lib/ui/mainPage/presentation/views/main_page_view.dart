import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/ui/browse/presentation/views/browse_page_view.dart';
import 'package:animebox/ui/home/presentation/views/home_page_view.dart';
import 'package:animebox/ui/library/presentation/views/library_page_view.dart';
import 'package:animebox/ui/mainPage/presentation/controllers/main_page_controller.dart';
import 'package:animebox/ui/mainPage/presentation/views/main_page_scaffold.dart';
import 'package:animebox/ui/mainPage/presentation/views/navigation.dart';
import 'package:animebox/ui/settings/presentation/views/settings_page.dart';
import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget {
  final MainPageController mainPageController;
  final Object? error;
  const MainPageView({
    super.key,
    MainPageController? mainPageController,
    this.error,
  }) : mainPageController =
           mainPageController ?? const MainPageControllerImpl();

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  bool filtering = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.error != null && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(widget.error.toString())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDesktopWidth(context);
    final mainPageTranslations = context.i18n.mainPage;

    final destinations = [
      (
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: mainPageTranslations.navigationWidgets.homeLabel,
      ),
      (
        icon: const Icon(Icons.video_library_outlined),
        selectedIcon: const Icon(Icons.video_library),
        label: mainPageTranslations.navigationWidgets.libraryLabel,
      ),
      (
        icon: const Icon(Icons.explore_outlined),
        selectedIcon: const Icon(Icons.explore),
        label: mainPageTranslations.navigationWidgets.browseLabel,
      ),
    ];

    return PopScope(
      onPopInvokedWithResult: (didPop, result) =>
          setState(() => filtering = false),

      canPop: !filtering,
      child: NavigationBuilder(
        onDestinationChangeAction: () => setState(() => filtering = false),
        builder: (navigationWidget, activeTab) {
          final isOnBrowsePage = activeTab is BrowsePageView;
          final scaffold = MainPageScaffold(
            filtering: filtering,
            isOnBrowsePage: isOnBrowsePage,
            isDesktop: isDesktop,
            filteringSetter: (value) => setState(() => filtering = value),
            navigationWidget: navigationWidget,
            activeTab: activeTab,
          );

          if (isDesktop) {
            return Row(
              children: [
                navigationWidget,
                const VerticalDivider(width: 1),
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
          elevation: 0,
          tooltip: context.i18n.settings.pageHeader,
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const SettingsPage())),
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
    );
  }
}
