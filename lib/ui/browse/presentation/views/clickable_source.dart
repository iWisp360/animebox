import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:flutter/material.dart';

class ClickableSource extends StatelessWidget {
  final AnimeSource source;
  final Function() onTap;
  const ClickableSource({super.key, required this.source, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const .symmetric(vertical: 15, horizontal: 15),
            child: Text(source.prettyName),
          ),
        ),
      ),
    );
  }
}
