import 'package:flutter/material.dart';

class GlobalSearchPageView extends StatefulWidget {
  const GlobalSearchPageView({super.key});

  @override
  State<GlobalSearchPageView> createState() => _GlobalSearchPageViewState();
}

class _GlobalSearchPageViewState extends State<GlobalSearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Global Search")));
  }
}
