import 'package:flutter/material.dart';

class TabBarContainer extends StatelessWidget {
  final Widget? child;
  const TabBarContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(padding: const .symmetric(vertical: 10), child: child),
          const Divider(height: 0),
        ],
      ),
    );
  }
}
