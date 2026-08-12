import 'package:animebox/core/widgets/page_information.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageInformation(
      message: "Working on it~",
      spritesKind: .happySprite,
    );
  }
}
