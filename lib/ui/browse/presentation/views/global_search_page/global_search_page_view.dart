import 'package:animebox/core/error/presentation/views/error_page.dart';
import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/features/search/data/providers/search_provider.dart';
import 'package:animebox/ui/browse/presentation/views/global_search_page/source_search_row.dart';
import 'package:animebox/ui/browse/presentation/views/server_selector_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalSearchPageView extends ConsumerStatefulWidget {
  final String? query;
  const GlobalSearchPageView({super.key, this.query});

  @override
  ConsumerState<GlobalSearchPageView> createState() =>
      _GlobalSearchPageViewState();
}

class _GlobalSearchPageViewState extends ConsumerState<GlobalSearchPageView> {
  late final TextEditingController _textEditingController;
  late final ScrollController _scrollController;
  late String sentQuery;
  late String currentQuery;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _scrollController = ScrollController();
    sentQuery = widget.query ?? "";
    currentQuery = widget.query ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final globalSearchTranslations = context.i18n.browsePage.search.global;
    final activeServer = ref.watch(activeServerProvider);

    return activeServer.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (server) => Scaffold(
        appBar: AppBar(title: const ServerSelectorOrTitle()),
        body: Padding(
          padding: calculateDefaultPadding(context),
          child: Column(
            children: [
              Padding(
                padding: const .symmetric(vertical: 10),
                child: SearchBarTheme(
                  data: SearchBarThemeData(
                    elevation: .all(0),
                    overlayColor: .all(Colors.transparent),
                  ),
                  child: Padding(
                    padding: const .symmetric(horizontal: 16),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 48),
                      child: SearchBar(
                        autoFocus: true,
                        hintText: globalSearchTranslations.allTheSources,
                        controller: _textEditingController,
                        leading: const Icon(Icons.search),
                        onChanged: (query) {
                          setState(() {
                            currentQuery = query;
                            if (query.isEmpty) {
                              sentQuery = "";
                            }
                          });
                        },
                        onSubmitted: (query) => setState(() {
                          sentQuery = query;
                        }),
                        trailing: [
                          if (currentQuery.isNotEmpty) ...[
                            if (sentQuery.isNotEmpty)
                              IconButton(
                                onPressed: () => refreshAll(ref),
                                icon: const Icon(Icons.refresh),
                              ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  sentQuery = "";
                                  currentQuery = "";
                                });
                                _textEditingController.clear();
                                _scrollController.jumpTo(0);
                              },
                              icon: const Icon(Icons.clear),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (sentQuery.isNotEmpty)
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => refreshAll(ref),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: const .symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            for (final source
                                in server.supportedAnimeSources) ...[
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: .infinity,
                                ),
                                child: SourceSearchRow(
                                  server: server,
                                  source: source,
                                  query: sentQuery,
                                ),
                              ),
                              const Divider(),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      error: (e, st) =>
          ErrorPage(isRecoverable: true, exception: e, stackTrace: st),
    );
  }

  Future<void> refreshAll(WidgetRef ref) async {
    ref.invalidate(asReload: true, searchRepositoryProvider);
  }
}
