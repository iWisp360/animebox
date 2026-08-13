import 'package:flutter/material.dart';

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
        child: InkWell(
          onTap: onClick,
          child: SizedBox(
            height: 330,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(
                  height: 280,
                  width: 200,
                  child: Card.filled(
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(_radius),
                    ),
                    child: ClipRRect(
                      borderRadius: .circular(_radius),
                      child: (image != null)
                          ? Image.network(
                              fit: .cover,
                              image!,
                              errorBuilder: (context, error, st) =>
                                  const Center(child: Icon(Icons.cloud_off)),
                            )
                          : const Center(child: Icon(Icons.cloud_off)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const double _radius = 8;
}
