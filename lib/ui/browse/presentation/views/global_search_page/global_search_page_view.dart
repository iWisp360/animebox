import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/error/presentation/views/error_page.dart';
import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/data/extensions/server.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/features/search/data/providers/search_provider.dart';
import 'package:animebox/ui/browse/presentation/views/global_search_page/app_bar.dart';
import 'package:animebox/ui/browse/presentation/views/global_search_page/source_search_row.dart';
import 'package:animebox/ui/routes.dart';
import 'package:animebox/ui/settings/presentation/views/server_settings/server_details/server_details_page.dart';
import 'package:animebox/ui/widgets/page_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final translations = ref.watch(i18nProvider);
    final globalSearchTranslations = translations.browsePage.search.global;
    final activeServer = ref.watch(activeServerProvider);

    final isPitchBlack = ref
        .watch(configProvider)
        .when(
          data: (config) => config.appearance.pitchBlack,
          error: (_, _) => false,
          loading: () => false,
        );

    final gradientColor = isPitchBlack
        ? Colors.black
        : ColorScheme.of(context).surface;

    return PopScope(
      canPop: !ref.watch(dialogOpenProvider),
      child: activeServer.when(
        loading: () => Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator()),
        ),
        data: (server) => Scaffold(
          appBar: globalSearchPageAppBar(
            context: context,
            ref: ref,
            gradientColor: gradientColor,
          ),
          body: Padding(
            padding: calculateDefaultPadding(context),
            child: server.enabledSources() == 0
                ? PageInformation(
                    message:
                        "No sources are enabled on server\n${server.name ?? server.uuid}",
                    customAction: FilledButton(
                      onPressed: () => context.push(
                        "/settings/servers/details",
                        extra: ServerDetailsPageParams(
                          serverUuid: server.uuid,
                          canDelete: false,
                        ),
                      ),
                      child: const Text("Configure this Server"),
                    ),
                  )
                : Stack(
                    children: [
                      if (sentQuery.isNotEmpty)
                        Positioned.fill(
                          child: RefreshIndicator(
                            onRefresh: () => refreshAll(ref),
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: Padding(
                                padding: const .only(top: 70),
                                child: Column(
                                  children: [
                                    for (final source
                                        in server.supportedAnimeSources) ...[
                                      if (source.enabled)
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
                                      if (source.enabled) const Divider(),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: .topCenter,
                              end: .bottomCenter,
                              colors: [
                                gradientColor,
                                gradientColor.withAlpha(0),
                              ],
                            ),
                          ),
                          height: 70,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Padding(
                          padding: const .symmetric(vertical: 10),
                          child: SearchBarTheme(
                            data: SearchBarThemeData(
                              elevation: .all(0),
                              overlayColor: .all(Colors.transparent),
                            ),
                            child: Padding(
                              padding: const .symmetric(horizontal: 16),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 48,
                                ),
                                child: SearchBar(
                                  autoFocus: true,
                                  hintText: globalSearchTranslations
                                      .sourcesSearchHint(
                                        n: server.enabledSources(),
                                      ),
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
                      ),
                    ],
                  ),
          ),
        ),
        error: (e, st) =>
            ErrorPage(isRecoverable: true, exception: e, stackTrace: st),
      ),
    );
  }

  Future<void> refreshAll(WidgetRef ref) async {
    ref.invalidate(asReload: true, searchProvider);
  }
}
