import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: .infinity,
      child: ClipRRect(
        borderRadius: .horizontal(right: const .circular(30)),
        child: ColoredBox(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
      ),
    );
  }
}
