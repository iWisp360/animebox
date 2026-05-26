import 'package:animebox/core/config.dart';
import 'package:flutter/material.dart';

const helperBarHeight = 30.0;

class HelperBar extends StatefulWidget {
  const HelperBar({super.key});

  @override
  State<HelperBar> createState() => _HelperBarState();
}

class _HelperBarState extends State<HelperBar> {
  @override
  Widget build(BuildContext context) {
    return Scrollable(
      axisDirection: AxisDirection.right,
      viewportBuilder: (context, offset) => SizedBox(
        height: helperBarHeight,
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Row(
              spacing: 10,
              children: [
                for (final category in config.library_.customCategories)
                  Chip(label: Text(category)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
