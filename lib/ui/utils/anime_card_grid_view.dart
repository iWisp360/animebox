import 'package:animebox/ui/utils/anime_card.dart';
import 'package:flutter/material.dart';

class AnimeCardGridView extends StatelessWidget {
  final List<AnimeCard> Function(BuildContext context) builder;
  const AnimeCardGridView({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: gridCrossAxisSpacing,
      crossAxisCount: calculateGridCrossAxisCount(context),
      childAspectRatio: gridElementAspectRatio,

      children: builder(context),
    );
  }

  int calculateGridCrossAxisCount(BuildContext context) =>
      switch (MediaQuery.of(context).size.width) {
        <= 500 => 2,
        <= 800 => 3,
        <= 1000 => 4,
        _ => 5,
      };

  double get gridElementAspectRatio => 9 / 16;
  double get gridCrossAxisSpacing => 5;
}
