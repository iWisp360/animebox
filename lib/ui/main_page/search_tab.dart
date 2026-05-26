import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  final String query;
  const SearchTab({super.key, required this.query});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.query));
  }
}
