import 'package:flutter/material.dart';

class FilterPageView extends StatelessWidget {
  final String? query;
  const FilterPageView({super.key, this.query});

  @override
  Widget build(BuildContext context) {
    return Center(child: (query != null) ? const Text("Filter") : null);
  }
}
