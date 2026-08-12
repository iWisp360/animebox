import 'package:animebox/core/error/presentation/views/error_page.dart';
import 'package:animebox/core/helpers/convergence.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/ui/browse/presentation/views/global_search_page/source_search_row.dart';
import 'package:animebox/ui/browse/presentation/views/server_selector_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalSearchPageView extends ConsumerStatefulWidget {
  const GlobalSearchPageView({super.key});

  @override
  ConsumerState<GlobalSearchPageView> createState() =>
      _GlobalSearchPageViewState();
}

class _GlobalSearchPageViewState extends ConsumerState<GlobalSearchPageView> {
  late final TextEditingController _textEditingController;
  late String sendedQuery;
  late String currentQuery;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    sendedQuery = "";
    currentQuery = "";
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        hintText: "Search on all the sources...",
                        controller: _textEditingController,
                        leading: const Icon(Icons.search),
                        onChanged: (query) {
                          if (query.isEmpty) {
                            setState(() {
                              sendedQuery = "";
                            });
                          }

                          setState(() {
                            currentQuery = query;
                          });
                        },
                        onSubmitted: (query) => setState(() {
                          sendedQuery = query;
                        }),
                        trailing: [
                          if (currentQuery.isNotEmpty)
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  sendedQuery = "";
                                  currentQuery = "";
                                });
                                _textEditingController.clear();
                              },
                              icon: const Icon(Icons.clear),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (sendedQuery.isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (final source in server.supportedAnimeSources)
                          SourceSearchRow(
                            server: server,
                            source: source,
                            query: sendedQuery,
                          ),
                      ],
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
}
