import 'package:animebox/src/rust/api/server.dart';
import 'package:animebox/src/rust/api/server/error.dart';
import 'package:animebox/ui/utils.dart';
import 'package:animebox/ui/widgets/search_result_card.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  final String query;
  final String sourceId;
  final String serverUrl;
  final ScrollController? scrollController;

  const SearchTab({
    super.key,
    required this.query,
    required this.sourceId,
    required this.serverUrl,
    this.scrollController,
  });

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final SnapshotController snapshotController;
  Future<List<dynamic>>? results;

  @override
  void initState() {
    super.initState();

    snapshotController = SnapshotController();
    if (widget.query.isNotEmpty) {
      results = search(
        serverUrl: widget.serverUrl,
        pattern: widget.query,
        sourceId: widget.sourceId,
      );
    }
  }

  @override
  void didUpdateWidget(covariant SearchTab oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.query.isNotEmpty) {
      results = search(
        serverUrl: "http://127.0.0.1:6969",
        pattern: widget.query,
        sourceId: widget.sourceId,
      );
    }
  }

  @override
  void dispose() {
    results = null;
    snapshotController.dispose();
    super.dispose();
  }

  String extractErrorMessage(Object? error) {
    switch (error) {
      case ServerError(:final field0):
        return field0;

      default:
        return "Failed to get error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: calculateDefaultPadding(context),
      child: SnapshotWidget(
        controller: snapshotController,
        child: FutureBuilder(
          future: results,
          builder: (context, snapshot) => AnimatedSwitcher(
            switchInCurve: Curves.easeInSine,
            switchOutCurve: Curves.easeOutSine,
            duration: const Duration(milliseconds: 100),
            child: snapshot.connectionState == .waiting
                ? const Center(child: CircularProgressIndicator())
                : snapshot.hasError
                ? Center(child: Text(extractErrorMessage(snapshot.error)))
                : widget.query.isEmpty
                ? const Center(child: Text("Enter your query"))
                : snapshot.data!.isEmpty
                ? const Center(child: Text("No Results"))
                : Padding(
                    padding: const .symmetric(horizontal: 8),
                    child: GridView.builder(
                      padding: const .only(bottom: 30),
                      controller: widget.scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getResultRowItems(context),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final result = snapshot.data![index];
                        return SearchResultCard(
                          imageUrl: result.image,
                          onTap: () => (),
                          name: result.name,
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

int getResultRowItems(BuildContext context) =>
    MediaQuery.of(context).size.width > 800
    ? 4
    : MediaQuery.of(context).size.width > 550
    ? 3
    : 2;
