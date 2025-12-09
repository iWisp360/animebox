import 'package:flutter/material.dart';

class AnimeBoxHome extends StatefulWidget {
  const AnimeBoxHome({super.key});

  @override
  State<AnimeBoxHome> createState() => _AnimeBoxHomeState();
}

class HomeElements {
  static List<Widget> destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: "Home",
    ),

    NavigationDestination(
      icon: Icon(Icons.video_collection_outlined),
      selectedIcon: Icon(Icons.video_collection),
      label: "My Anime",
    ),
  ];
}

class _AnimeBoxHomeState extends State<AnimeBoxHome> {
  int currentPageIndex = 0;

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anime Box")),

      bottomNavigationBar: NavigationBar(
        animationDuration: Duration(seconds: 1),
        destinations: HomeElements.destinations,
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
