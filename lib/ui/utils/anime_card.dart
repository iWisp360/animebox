import 'package:animebox/core/images/data/datasources/image_source.dart';
import 'package:animebox/ui/utils/images.dart';
import 'package:flutter/material.dart';

const double _radius = 8;

class AnimeCard extends StatelessWidget {
  final String name;
  final String? url;
  final List<ImageSource>? imageSources;
  final bool displayMissingUrlIcon;
  final Function()? onClick;

  const AnimeCard({
    super.key,
    required this.name,
    this.imageSources,
    this.url,
    this.displayMissingUrlIcon = false,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(_radius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClick,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              _Portrait(imageSources: imageSources),
              _SerieTitle(
                name: name,
                url: url,
                displayMissingUrlIcon: displayMissingUrlIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Portrait extends StatelessWidget {
  final List<ImageSource>? imageSources;
  const _Portrait({this.imageSources});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 13,
      child: Card.filled(
        shape: RoundedRectangleBorder(borderRadius: .circular(_radius)),
        child: ClipRRect(
          borderRadius: .circular(_radius),
          child: ImageBuilder(sources: .nullable(imageSources)),
        ),
      ),
    );
  }
}

class _SerieTitle extends StatelessWidget {
  final String name;
  final String? url;
  final bool displayMissingUrlIcon;
  const _SerieTitle({
    required this.name,
    this.url,
    required this.displayMissingUrlIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const .only(right: 4),
              child: Text(name, maxLines: 2, overflow: .ellipsis),
            ),
          ),
          if (url == null && displayMissingUrlIcon)
            Icon(Icons.link_off, color: Theme.of(context).colorScheme.error),
        ],
      ),
    );
  }
}
