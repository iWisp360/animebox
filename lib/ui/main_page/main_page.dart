import 'dart:async';

import 'package:animebox/anime_sources.dart';
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var page = switch (config.appearance.initScreen) {
    HomeTabs.home => 0,
    HomeTabs.library_ => 1,
    HomeTabs.search => 2,
  };

  var searching = false;
  var searchServer = config.servers.servers.firstOrNull?.url;
  late final AnimationController _animationController;
  final TextEditingController _editingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _editingTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    _editingController.dispose();
    _editingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !searching,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        _disableSearch();
      },
      child: Scaffold(
        drawer: const Placeholder(),
        endDrawerEnableOpenDragGesture: searching,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: _animationController,
              ),
              onPressed: searching
                  ? () async {
                      _disableSearch();
                    }
                  : () => Scaffold.of(context).openDrawer(),
            ),
          ),

          title: !searching
              ? const Text("Anime Box")
              : Center(
                  child: Padding(
                    padding: const EdgeInsetsGeometry.only(bottom: 18),
                    child: TextFormField(
                      autofocus: true,
                      onChanged: (query) {
                        if (_editingTimer != null) _editingTimer?.cancel();

                        _editingTimer = Timer(
                          const Duration(milliseconds: 500),
                          () => _editingController.text = query,
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
            ValueListenableBuilder(
              valueListenable: animeSourcesController.isRefreshing,
              builder: (context, isRefreshing, child) => IconButton(
                onPressed:
                    searching ||
                        animeSourcesController.cacheManager.sources.isEmpty ||
                        isRefreshing
                    ? null
                    : () => setState(() {
                        searching = true;
                        _animationController.forward();
                      }),
                icon: Icon(
                  Icons.search_rounded,
                  color: animeSourcesController.cacheManager.sources.isEmpty
                      ? Theme.of(context).disabledColor
                      : !searching
                      ? Theme.of(context).colorScheme.onSurfaceVariant
                      : Colors.transparent,
                ),
              ),
            ),
            !searching
                ? IconButton(
                    onPressed: () => (),
                    icon: const Icon(Icons.download_rounded),
                  )
                : MenuAnchor(
                    builder: (context, controller, child) => IconButton(
                      onPressed: () => controller.isOpen
                          ? controller.close()
                          : controller.open(),
                      icon: const Icon(Icons.filter_list),
                    ),
                    menuChildren: [
                      SubmenuButton(
                        submenuIcon: const WidgetStatePropertyAll(
                          Icon(Icons.arrow_left),
                        ),
                        menuChildren: [
                          for (final server in config.servers.servers)
                            MenuItemButton(
                              child: Text(server.name ?? server.url),
                              onPressed: () => setState(() {
                                searchServer = server.url;
                              }),
                            ),
                        ],
                        child: const Text("Server"),
                      ),
                    ],
                  ),
            IconButton(
              onPressed: () => Navigator.of(context).push(_configRoute()),
              icon: const Icon(Icons.settings_rounded),
              tooltip: "Settings",
            ),
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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: searching
                          ? ValueListenableBuilder(
                              valueListenable: _editingController,
                              builder: (context, query, child) => SearchTab(
                                scrollController: _scrollController,
                                serverUrl: "http://127.0.0.1:6969",
                                query: _editingController.text,
                                sourceId: "animeflv",
                              ),
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

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 15,
                    child: IgnorePointer(
                      child: Builder(
                        builder: (context) {
                          final baseColor = config.appearance.pitchBlack
                              ? Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerLowest
                              : Theme.of(context).colorScheme.surfaceContainer;

                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  baseColor.withValues(alpha: 0),
                                  baseColor,
                                ],
                                begin: AlignmentGeometry.topCenter,
                                end: AlignmentGeometry.bottomCenter,
                                stops: const [0, 1],
                              ),
                            ),
                            child: const SizedBox.shrink(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        bottomNavigationBar: NavigationBar(
          destinations: navigationDestinations,
          backgroundColor: config.appearance.pitchBlack
              ? Theme.of(context).colorScheme.surfaceContainerLowest
              : Theme.of(context).colorScheme.surfaceContainer,
          onDestinationSelected: (destination) async {
            setState(() {
              page = destination;
            });
            if (searching) {
              _disableSearch();
            }
          },
          selectedIndex: page,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }

  Future<void> _disableSearch() async {
    setState(() {
      searching = false;
      _animationController.reverse();
    });

    await Future.delayed(const Duration(milliseconds: 300));
    _editingController.clear();
  }
}

Route<void> _configRoute() {
  return MaterialPageRoute(builder: (context) => const ConfigPage());
}
