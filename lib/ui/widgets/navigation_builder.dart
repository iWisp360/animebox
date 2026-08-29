import 'package:animebox/core/helpers/convergence.dart';
import 'package:flutter/material.dart';

class NavigationBuilder extends StatefulWidget {
  final Widget Function(Widget? navigationWidget, Widget activeTab) builder;
  final List<Widget> tabs;
  final bool useNavBar;
  final List<NavigationDestination>? navBarDestinations;
  final List<NavigationRailDestination> navRailDestinations;
  final Widget? leadingRailAction;
  final Widget? trailingRailAction;

  final Widget? noIndexTab;
  final bool useNoIndexTab;

  final Function()? onDestinationChangeAction;

  const NavigationBuilder({
    super.key,
    required this.builder,
    required this.tabs,
    this.noIndexTab,
    this.useNavBar = true,
    this.useNoIndexTab = false,
    this.navBarDestinations,
    required this.navRailDestinations,
    this.leadingRailAction,
    this.trailingRailAction,
    this.onDestinationChangeAction,
  }) : assert(
         navBarDestinations == null || tabs.length == navBarDestinations.length,
       ),
       assert(tabs.length == navRailDestinations.length);

  @override
  State<NavigationBuilder> createState() => _NavigationBuilderState();
}

class _NavigationBuilderState extends State<NavigationBuilder> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = widget.useNoIndexTab ? null : _selectedIndex;

    return widget.builder(
      (isDesktopWidth(context))
          ? NavigationRail(
              destinations: widget.navRailDestinations,
              selectedIndex: selectedIndex,
              labelType: .all,
              onDestinationSelected: (dest) => onDestinationSelected(dest),
              scrollable: true,
              leading: widget.leadingRailAction,
              elevation: 2,
              trailing: Padding(
                padding: const .symmetric(vertical: 12),
                child: widget.trailingRailAction,
              ),
              trailingAtBottom: true,
            )
          : (widget.useNavBar
                ? NavigationBar(
                    destinations: widget.navBarDestinations!,
                    selectedIndex: selectedIndex ?? 0,
                    onDestinationSelected: (dest) =>
                        onDestinationSelected(dest),

                    labelBehavior: .onlyShowSelected,
                    animationDuration: const Duration(seconds: 1),
                  )
                : null),
      selectedIndex != null
          ? widget.tabs[selectedIndex]
          : widget.noIndexTab ?? const Center(child: Text("No Tab to use")),
    );
  }

  void onDestinationSelected(int destination) {
    setState(() {
      _selectedIndex = destination;
    });

    if (widget.onDestinationChangeAction != null) {
      widget.onDestinationChangeAction!();
    }
  }
}
