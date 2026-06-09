import 'dart:async';

import 'package:animebox/anime_sources.dart';
import 'package:animebox/core/config.dart';
import 'package:animebox/src/rust/api/data/caching/anime_sources.dart';
import 'package:flutter/material.dart';

const helperBarHeight = 30.0;

class HelperBar extends StatefulWidget {
  const HelperBar({super.key});

  @override
  State<HelperBar> createState() => _HelperBarState();
}

class _HelperBarState extends State<HelperBar> {
  @override
  Widget build(BuildContext context) {
    return Scrollable(
      axisDirection: AxisDirection.right,
      viewportBuilder: (context, offset) => ValueListenableBuilder(
        valueListenable: animeSourcesController.isRefreshing,
        builder: (context, isRefreshing, child) => SizedBox(
          height: helperBarHeight,
          child: isRefreshing
              ? const SourcesRefreshingMode()
              : const CategoriesMode(),
        ),
      ),
    );
  }
}

class SourcesRefreshingMode extends StatefulWidget {
  const SourcesRefreshingMode({super.key});

  @override
  State<SourcesRefreshingMode> createState() => _SourcesRefreshingModeState();
}

class _SourcesRefreshingModeState extends State<SourcesRefreshingMode> {
  Stream<RefreshJob>? refreshProgressStream;
  StreamSubscription? streamSubscription;
  RefreshJob? refreshProgress;

  @override
  void initState() {
    super.initState();

    refreshProgressStream = animeSourcesController.getCurrentRefresh();
    streamSubscription = refreshProgressStream!.listen(
      (refreshProgress) => refreshProgress = refreshProgress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            refreshProgress?.success == 0
                ? "Refreshing Anime Sources... Search disabled at the moment."
                : "${refreshProgress?.success} out of ${refreshProgress?.total} servers refreshed, and ${refreshProgress?.error} servers failed.",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}

class CategoriesMode extends StatefulWidget {
  const CategoriesMode({super.key});

  @override
  State<CategoriesMode> createState() => _CategoriesModeState();
}

class _CategoriesModeState extends State<CategoriesMode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Align(
        alignment: AlignmentGeometry.centerLeft,
        child: Row(
          spacing: 10,
          children: [
            for (final category in config.library_.customCategories)
              Chip(label: Text(category)),
          ],
        ),
      ),
    );
  }
}
