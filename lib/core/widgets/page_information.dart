import 'dart:io';

import 'package:animebox/features/sprites/data/repositories/sprites_mayuri.dart';
import 'package:animebox/features/sprites/domain/entities/sprites_kind.dart';
import 'package:animebox/features/sprites/domain/repositories/sprites_pack.dart';
import 'package:flutter/material.dart';

class PageInformation extends StatelessWidget {
  final String message;
  final SpritesKind? spritesKind;
  final SpritesPack spritesPack;
  final Widget? customAction;

  const PageInformation({
    super.key,
    required this.message,
    this.spritesKind,
    this.customAction,
    SpritesPack? spritesPack,
  }) : spritesPack = spritesPack ?? const SpritesMayuri();

  @override
  Widget build(BuildContext context) {
    final image = switch (spritesKind) {
      .loadingSprite => spritesPack.loadingSprite,
      .searchSprite => spritesPack.searchSprite,
      _ => spritesPack.errorSprite,
    };

    final bool chooseRow =
        (Platform.isAndroid &&
            MediaQuery.of(context).orientation == .landscape) ||
        (MediaQuery.of(context).size.height < 480);

    final widgetProps = (
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: SizedBox(
            width: 300,
            child: Padding(padding: const .all(10), child: image),
          ),
        ),
        Flexible(
          child: Center(
            heightFactor: 1.1,
            child: Padding(
              padding: !chooseRow ? const .symmetric(horizontal: 10) : .zero,
              child: Column(
                mainAxisAlignment: .spaceBetween,
                spacing: 20,
                mainAxisSize: .min,
                children: [
                  Text(
                    message,
                    maxLines: 10,
                    textAlign: .center,
                    style: const TextStyle(fontWeight: .w600),
                  ),
                  ?customAction,
                ],
              ),
            ),
          ),
        ),
      ],
    );

    return Center(
      child: chooseRow
          ? Row(
              mainAxisAlignment: widgetProps.mainAxisAlignment,
              crossAxisAlignment: widgetProps.crossAxisAlignment,
              children: widgetProps.children,
            )
          : Column(
              mainAxisAlignment: widgetProps.mainAxisAlignment,
              crossAxisAlignment: widgetProps.crossAxisAlignment,
              spacing: 40,
              children: widgetProps.children,
            ),
    );
  }
}
