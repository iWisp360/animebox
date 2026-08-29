import 'package:animebox/core/helpers/convergence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedIndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void change(int destination) => state = destination;
}

final selectedIndexProvider = NotifierProvider(() => SelectedIndexNotifier());

class NavigationBuilder extends ConsumerWidget {
  final Widget Function(Widget? navigationWidget, Widget activeTab) builder;
  final List<Widget> tabs;
  final bool useNavBar;
  final List<NavigationDestination>? navBarDestinations;
  final List<NavigationRailDestination> navRailDestinations;
  final Widget? leadingRailAction;
  final Widget? trailingRailAction;
  final Function()? onDestinationChangeAction;

  const NavigationBuilder({
    super.key,
    required this.builder,
    required this.tabs,
    this.useNavBar = true,
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
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return builder(
      (isDesktopWidth(context))
          ? NavigationRail(
              destinations: navRailDestinations,
              selectedIndex: selectedIndex,
              labelType: .all,
              onDestinationSelected: (dest) => onDestinationSelected(dest, ref),
              scrollable: true,
              leading: leadingRailAction,
              elevation: 2,
              trailing: Padding(
                padding: const .symmetric(vertical: 12),
                child: trailingRailAction,
              ),
              trailingAtBottom: true,
            )
          : (useNavBar
                ? NavigationBar(
                    destinations: navBarDestinations!,
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (dest) =>
                        onDestinationSelected(dest, ref),

                    labelBehavior: .onlyShowSelected,
                    animationDuration: const Duration(seconds: 1),
                  )
                : null),
      tabs[selectedIndex],
    );
  }

  void onDestinationSelected(int destination, WidgetRef ref) =>
      ref.read(selectedIndexProvider.notifier).change(destination);
}
