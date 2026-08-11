import 'package:animebox/core/helpers/convergence.dart';
import 'package:flutter/material.dart';

class NavigationBuilder extends StatefulWidget {
  final Widget Function(Widget navigationWidget, Widget activeTab) builder;
  final List<Widget> tabs;
  final List<NavigationDestination> navBarDestinations;
  final List<NavigationRailDestination> navRailDestinations;
  final Widget? leadingRailAction;
  final Widget? trailingRailAction;
  final Function()? onDestinationChangeAction;
  final int? selectedIndex;

  const NavigationBuilder({
    super.key,
    required this.builder,
    required this.tabs,
    required this.navBarDestinations,
    required this.navRailDestinations,
    this.leadingRailAction,
    this.trailingRailAction,
    this.onDestinationChangeAction,
    this.selectedIndex,
  });

  @override
  State<NavigationBuilder> createState() => _NavigationBuilderState();
}

class _NavigationBuilderState extends State<NavigationBuilder> {
  int selectedIndex = 0;

  @override
  void initState() {
    assertions();
    final widgetSelectedIndex = widget.selectedIndex;
    if (widgetSelectedIndex != null) {
      selectedIndex = widgetSelectedIndex;
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant NavigationBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newSelectedIndex = widget.selectedIndex;
    if (newSelectedIndex != null &&
        oldWidget.selectedIndex != newSelectedIndex) {
      selectedIndex = newSelectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      (isDesktopWidth(context))
          ? NavigationRail(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              destinations: widget.navRailDestinations,
              selectedIndex: selectedIndex,
              labelType: .all,
              onDestinationSelected: onDestinationSelected,
              scrollable: true,
              leading: widget.leadingRailAction,
              trailing: Padding(
                padding: const .symmetric(vertical: 12),
                child: widget.trailingRailAction,
              ),
              trailingAtBottom: true,
            )
          : NavigationBar(
              destinations: widget.navBarDestinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,

              labelBehavior: .onlyShowSelected,
              animationDuration: const Duration(seconds: 1),
            ),
      widget.tabs[selectedIndex],
    );
  }

  void onDestinationSelected(int destination) {
    setState(() => selectedIndex = destination);
    final onDestinationChangeAction = widget.onDestinationChangeAction;

    if (onDestinationChangeAction != null) {
      onDestinationChangeAction();
    }
  }

  void assertions() {
    assert(widget.tabs.length == widget.navBarDestinations.length);
    assert(widget.tabs.length == widget.navRailDestinations.length);
  }
}
