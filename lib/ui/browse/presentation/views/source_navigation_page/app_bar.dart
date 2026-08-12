import 'package:animebox/core/servers/domain/entities/anime_sources.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget sourceNavigationPageAppBar(
  BuildContext context,
  AnimeSource source,
) => AppBar(title: Text(source.prettyName));
