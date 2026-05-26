import 'dart:async';

import 'package:animebox/core/config.dart';
import 'package:animebox/src/rust/api/app/sections.dart';
import 'package:animebox/ui/config_page/config_page.dart';
import 'package:animebox/ui/main_page/helper_bar.dart';
import 'package:animebox/ui/main_page/home_tab.dart';
import 'package:animebox/ui/main_page/library_tab.dart';
import 'package:animebox/ui/main_page/search_tab.dart';
import 'package:animebox/ui/main_page/trackers_tab.dart';
import 'package:flutter/material.dart';

List<Widget> navigationDestinations = [
  const NavigationDestination(
    selectedIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
    label: "Home",
  ),

  const NavigationDestination(
    selectedIcon: Icon(Icons.video_library),
    icon: Icon(Icons.video_library_outlined),
    label: "Library",
  ),

  const NavigationDestination(
    selectedIcon: Icon(Icons.auto_graph),
    icon: Icon(Icons.auto_graph_outlined),
    label: "Trackers",
  ),
];

Widget settingsButton(BuildContext context) {
  return IconButton(
    onPressed: () => Navigator.of(context).push(_configRoute()),
    icon: const Icon(Icons.settings_rounded),
    tooltip: "Settings",
  );
}

Widget downloadButton = IconButton(
  onPressed: () => (),
  icon: const Icon(Icons.download_rounded),
  tooltip: "Downloads",
);

List<Widget> tabList = [
  const HomeTab(),
  const LibraryTab(),
  const TrackersTab(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var page = switch (config.appearance.initScreen) {
    HomeTabs.home => 0,
    HomeTabs.library_ => 1,
    HomeTabs.search => 2,
  };

  var searching = false;

  final TextEditingController editingController = TextEditingController();
  Timer? editingTimer;

  @override
  void dispose() {
    editingController.dispose();
    editingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !searching,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        setState(() => searching = false);
      },
      child: Scaffold(
        backgroundColor: config.appearance.pitchBlack ? Colors.black : null,
        drawer: const Placeholder(),
        appBar: !searching
            ? AppBar(
                leading: Builder(
                  builder: (context) => DrawerButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),

                title: const Text("Anime Box"),
                actions: [
                  IconButton(
                    onPressed: () => setState(() {
                      searching = true;
                    }),
                    icon: const Icon(Icons.search_rounded),
                    tooltip: "Search",
                  ),
                  downloadButton,
                  settingsButton(context),
                  const Padding(padding: EdgeInsetsGeometry.only(right: 8)),
                ],
              )
            : AppBar(
                leading: IconButton(
                  onPressed: () => setState(() {
                    searching = false;
                  }),
                  icon: const Icon(Icons.arrow_back),
                ),
                title: Center(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.only(bottom: 18),
                    child: TextFormField(
                      autofocus: true,
                      onChanged: (query) {
                        if (editingTimer != null) editingTimer?.cancel();

                        editingTimer = Timer(
                          const Duration(milliseconds: 500),
                          () => editingController.text = query,
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: "Search...",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                      ),

                      cursorHeight: 23,
                    ),
                  ),
                ),
                actions: [
                  downloadButton,
                  settingsButton(context),
                  const Padding(padding: EdgeInsetsGeometry.only(right: 8)),
                ],
              ),

        body: Column(
          children: [
            AnimatedContainer(
              curve: Curves.easeInOutSine,
              duration: const Duration(milliseconds: 300),
              height: searching ? 0 : helperBarHeight,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutSine,
                offset: searching ? const Offset(0, -1) : Offset.zero,
                child: const ClipRect(child: HelperBar()),
              ),
            ),

            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: searching
                    ? ValueListenableBuilder(
                        valueListenable: editingController,
                        builder: (context, query, child) =>
                            SearchTab(query: editingController.text),
                      )
                    : tabList[page],
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(animation),
                  child: child,
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: NavigationBar(
          destinations: navigationDestinations,
          onDestinationSelected: (destination) => setState(() {
            page = destination;
            searching = false;
          }),
          selectedIndex: page,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}

Route<void> _configRoute() {
  return MaterialPageRoute(builder: (context) => const ConfigPage());
}
