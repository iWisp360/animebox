import 'package:flutter/material.dart';

class NavigationBarBuilder extends StatefulWidget {
  final Widget Function(Widget navigationBar, Widget activeTab) builder;
  final List<Widget> tabs;
  final List<NavigationDestination> destinations;
  final int? selectedIndex;

  const NavigationBarBuilder({
    super.key,
    required this.builder,
    required this.tabs,
    required this.destinations,
    this.selectedIndex,
  });

  @override
  State<NavigationBarBuilder> createState() => _NavigationBarBuilderState();
}

class _NavigationBarBuilderState extends State<NavigationBarBuilder> {
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
  void didUpdateWidget(covariant NavigationBarBuilder oldWidget) {
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
      NavigationBar(
        destinations: widget.destinations,
        selectedIndex: selectedIndex,
        onDestinationSelected: (destination) =>
            setState(() => selectedIndex = destination),

        labelBehavior: .onlyShowSelected,
        animationDuration: const Duration(seconds: 1),
      ),
      widget.tabs[selectedIndex],
    );
  }

  void assertions() {
    assert(widget.tabs.length == widget.destinations.length);
  }
}
