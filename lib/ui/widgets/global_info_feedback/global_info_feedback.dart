import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/ui/widgets/global_info_feedback/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalInfoFeedback extends ConsumerStatefulWidget {
  final Function(BuildContext context) builder;
  const GlobalInfoFeedback({super.key, required this.builder});

  @override
  ConsumerState<GlobalInfoFeedback> createState() => _GlobalInfoFeedbackState();
}

class _GlobalInfoFeedbackState extends ConsumerState<GlobalInfoFeedback> {
  bool _instantColor = true;

  void setContextInNotifier() =>
      ref.read(globalNotificationController.notifier).setContext(context);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(globalNotificationController);

    ref.listen(
      globalNotificationController,
      (prev, next) => setState(() {
        _instantColor = (prev == null || !prev.enabled);
      }),
    );

    ref.listen(configProvider, (prev, next) {
      next.when(
        data: (_) => setContextInNotifier(),
        error: (_, _) => (),
        loading: () => (),
      );
    });

    double topPadding = _calculateHeightOffset(context);
    final height = topPadding + 30;

    final noPadding = topPadding <= 0;

    if (topPadding <= 0) {
      topPadding = height;
    }

    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutExpo,
          top: (state.enabled) ? topPadding : 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: widget.builder(context),
        ),
        Positioned(
          top: topPadding * -1,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutExpo,
            padding: .only(
              top: (state.enabled)
                  ? (topPadding <= 0 ? height : topPadding)
                  : 0,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: state.enabled ? height : 0,
              width: MediaQuery.widthOf(context),
              curve: Curves.easeOutExpo,
              child: OverflowBox(
                maxHeight: height,
                child: Scaffold(
                  body: AnimatedContainer(
                    width: .infinity,
                    height: .infinity,
                    duration: Duration(milliseconds: _instantColor ? 0 : 200),
                    color: switch (state.priority) {
                      .warning => Theme.of(context).colorScheme.tertiary,
                      .error => Theme.of(context).colorScheme.error,
                      _ => Theme.of(context).colorScheme.primary,
                    },
                    child: Padding(
                      padding: noPadding ? .zero : .only(top: topPadding),
                      child: Center(
                        child: Text(
                          state.message ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            color: switch (state.priority) {
                              .warning => Theme.of(
                                context,
                              ).colorScheme.onTertiary,
                              .error => Theme.of(context).colorScheme.onError,
                              _ => Theme.of(context).colorScheme.onPrimary,
                            },
                            fontWeight: .w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _calculateHeightOffset(BuildContext context) =>
      MediaQuery.of(context).padding.top;
}
