import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimeCard extends StatelessWidget {
  final String name;
  final String? url;
  final String? image;
  final Function()? onClick;

  const AnimeCard({
    super.key,
    required this.name,
    this.image,
    this.url,
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
              AspectRatio(
                aspectRatio: 9 / 13,
                child: Card.filled(
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(_radius),
                  ),
                  child: ClipRRect(
                    borderRadius: .circular(_radius),
                    child: (image != null)
                        ? Transform.scale(
                            scale: 1.01,
                            child: FadeInImage.memoryNetwork(
                              fadeInDuration: const Duration(milliseconds: 200),
                              fadeInCurve: Curves.easeInOutExpo,
                              fit: .cover,
                              placeholder: kTransparentImage,
                              imageErrorBuilder: (context, e, st) =>
                                  const Center(child: Icon(Icons.broken_image)),
                              image: image!,
                            ),
                          )
                        : const Center(child: Icon(Icons.cloud_off)),
                  ),
                ),
              ),
              Padding(
                padding: const .symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const .only(right: 4),
                        child: Text(name, maxLines: 2, overflow: .ellipsis),
                      ),
                    ),
                    if (url == null)
                      Icon(
                        Icons.link_off,
                        color: Theme.of(context).colorScheme.error,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const double _radius = 8;
}
