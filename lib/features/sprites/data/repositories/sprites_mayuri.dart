import 'package:animebox/features/sprites/data/datasources/sprites_mayuri.dart';
import 'package:animebox/features/sprites/domain/repositories/sprites_pack.dart';
import 'package:flutter/material.dart';

class SpritesMayuri implements SpritesPack {
  final provider = SpritesMayuriProvider();

  @override
  Image get errorSprite => Image.asset(provider.assetMayuriError());

  @override
  // TODO: implement loadingSprite
  Image get loadingSprite => throw UnimplementedError();

  @override
  // TODO: implement searchSprite
  Image get searchSprite => throw UnimplementedError();
}
