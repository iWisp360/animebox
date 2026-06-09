import 'package:animebox/core/config.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchResultCard extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final Function()? onTap;
  const SearchResultCard({super.key, this.imageUrl, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 18.0;
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            clipBehavior: .antiAlias,
            borderRadius: .circular(borderRadius),
            child: FadeInImage.memoryNetwork(
              filterQuality: .low,
              placeholder: kTransparentImage,
              fadeInDuration: const Duration(milliseconds: 100),
              fadeInCurve: Curves.easeOutSine,
              fadeOutDuration: const Duration(milliseconds: 100),
              fadeOutCurve: Curves.easeOutSine,
              image: imageUrl ?? "",
              imageErrorBuilder: (context, error, stacktrace) =>
                  const Center(child: Icon(Icons.broken_image)),
              fit: .cover,
            ),
          ),
        ),

        Positioned(
          bottom: -1,
          left: -0.5,
          right: -0.5,
          height: 150,
          child: Builder(
            builder: (context) {
              final baseColor = config.appearance.pitchBlack
                  ? Colors.black
                  : Theme.of(context).colorScheme.surface;
              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: .topCenter,
                    end: .bottomCenter,
                    colors: [baseColor.withValues(alpha: 0), baseColor],
                  ),
                ),
                child: Padding(
                  padding: const .symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .start,
                    mainAxisSize: .max,
                    children: [
                      Text(
                        name ?? "Unknown Name",
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16, fontWeight: .w600),
                        overflow: .ellipsis,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
