import 'package:animebox/core/configs/presentation/views/config_builder.dart';
import 'package:animebox/core/l10n/context.dart';
import 'package:animebox/features/home/presentation/views/home_page_view.dart';
import 'package:animebox/features/library/presentation/views/library_page_view.dart';
import 'package:animebox/features/mainPage/presentation/controllers/main_page_controller.dart';
import 'package:animebox/features/mainPage/presentation/views/app_bar.dart';
import 'package:animebox/features/mainPage/presentation/views/drawer.dart';
import 'package:animebox/features/mainPage/presentation/views/navigation_bar.dart';
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
    return ConfigBuilder(
      builder: (controller, context) => PopScope(
        onPopInvokedWithResult: (didPop, result) =>
            setState(() => filtering = false),

        canPop: !filtering,
        child: NavigationBarBuilder(
          builder: (navigationBar, activeTab) => Scaffold(
            drawerEnableOpenDragGesture: !filtering,
            drawer: const HomeDrawer(),
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
                filterSetter: (value) => setState(() => filtering = value),
                isOnSearchTab: false,
                context,
              ),
            ),
            body: activeTab,
            bottomNavigationBar: navigationBar,
          ),

          tabs: const [HomePageView(), LibraryPageView()],
          destinations: [
            NavigationDestination(
              selectedIcon: const Icon(Icons.home),
              icon: const Icon(Icons.home_outlined),
              label: context.l10n.homePageLabelNavBar,
            ),

            NavigationDestination(
              icon: const Icon(Icons.video_library_outlined),
              selectedIcon: const Icon(Icons.video_library),
              label: context.l10n.libraryPageLabelNavBar,
            ),
          ],
        ),
      ),
    );
  }
}
