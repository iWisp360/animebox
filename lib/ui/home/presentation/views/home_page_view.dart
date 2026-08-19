import 'package:animebox/ui/widgets/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageInformation(
      message: "Working on it~",
      spritesKind: .happySprite,
    );
  }
}
