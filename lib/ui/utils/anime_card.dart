import 'dart:io';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

const double _radius = 8;

class AnimeCard extends StatelessWidget {
  final String name;
  final String? url;
  final String? image;
  final File? cacheImage;
  final bool displayMissingUrlIcon;
  final Function()? onClick;

  const AnimeCard({
    super.key,
    required this.name,
    this.image,
    this.cacheImage,
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
              _Portrait(image: image, cacheImage: cacheImage),
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
  final String? image;
  final File? cacheImage;
  const _Portrait({this.image, this.cacheImage});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 13,
      child: Card.filled(
        shape: RoundedRectangleBorder(borderRadius: .circular(_radius)),
        child: ClipRRect(
          borderRadius: .circular(_radius),
          child: (cacheImage != null)
              ? Image.file(cacheImage!, fit: .cover)
              : (image != null)
              ? Transform.scale(
                  scale: 1.01,
                  child: FadeInImage.memoryNetwork(
                    fadeInDuration: const Duration(milliseconds: 200),
                    fadeInCurve: Curves.easeInOutExpo,
                    fit: .cover,
                    placeholder: kTransparentImage,
                    imageErrorBuilder: (_, _, _) =>
                        const Center(child: Icon(Icons.broken_image)),
                    image: image!,
                  ),
                )
              : const Center(child: Icon(Icons.cloud_off)),
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
