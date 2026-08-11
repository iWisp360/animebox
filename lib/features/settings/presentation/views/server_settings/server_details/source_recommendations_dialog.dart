import 'package:flutter/material.dart';

class SourceRecommendationsDialog extends StatelessWidget {
  final String sourceName;
  final String recommendation;
  const SourceRecommendationsDialog({
    super.key,
    required this.sourceName,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Recommendations for source $sourceName"),
      content: Text(recommendation),
      actionsAlignment: .center,
      actions: [
        FilledButton.tonal(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Done"),
        ),
      ],
    );
  }
}
