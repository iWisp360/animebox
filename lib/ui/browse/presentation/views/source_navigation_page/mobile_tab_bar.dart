import 'package:animebox/gen/strings.g.dart';
import 'package:animebox/ui/browse/presentation/views/source_navigation_page/source_navigation_page.dart';
import 'package:animebox/ui/widgets/filter_chip_color.dart';
import 'package:animebox/ui/widgets/tab_view/tab_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceNavigationPageMobileTabBar extends ConsumerWidget {
  final Translations translations;
  final SourceNavigationPages? currentPage;

  final Function(SourceNavigationPages page) onNavigate;

  const SourceNavigationPageMobileTabBar({
    super.key,
    required this.translations,
    required this.onNavigate,
    this.currentPage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chipBackgroundColor = filterChipColor(ref, context);

    final sourcesNavigationPageTranslations =
        translations.browsePage.sources.navigation;

    return TabBarContainer(
      child: Padding(
        padding: const .symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            FilterChip(
              backgroundColor: chipBackgroundColor,
              showCheckmark: false,
              avatar: const Icon(Icons.favorite_outlined),
              label: Text(sourcesNavigationPageTranslations.popularAnimes),
              selected: currentPage == .popular,
              onSelected: (_) => onNavigate(.popular),
            ),
            FilterChip(
              backgroundColor: chipBackgroundColor,
              showCheckmark: false,
              avatar: const Icon(Icons.update_outlined),
              label: Text(sourcesNavigationPageTranslations.latestAnimes),
              selected: currentPage == .latest,
              onSelected: (selected) => onNavigate(.latest),
            ),
          ],
        ),
      ),
    );
  }
}
