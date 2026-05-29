import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchResultCard extends StatefulWidget {
  final String? imageUrl;
  final String? name;
  final Function()? onTap;
  const SearchResultCard({super.key, this.imageUrl, this.name, this.onTap});

  @override
  State<SearchResultCard> createState() => _SearchResultCardState();
}

class _SearchResultCardState extends State<SearchResultCard> {
  @override
  Widget build(BuildContext context) {
    const double borderRadius = 16.0;
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(borderRadius),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadiusGeometry.circular(borderRadius),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                fadeInDuration: const Duration(milliseconds: 100),
                fadeInCurve: Curves.easeOutSine,
                fadeOutDuration: const Duration(milliseconds: 100),
                fadeOutCurve: Curves.easeOutSine,
                image: widget.imageUrl ?? "",
                imageErrorBuilder: (context, error, stacktrace) =>
                    const Center(child: Icon(Icons.broken_image)),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 60,
            child: ClipRRect(
              borderRadius: const BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Theme.of(context).colorScheme.surface.withAlpha(240),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.name ?? "",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          shadows: [Shadow(blurRadius: 6)],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(borderRadius),
              child: Material(
                color: Colors.transparent,
                child: InkWell(onTap: widget.onTap),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
