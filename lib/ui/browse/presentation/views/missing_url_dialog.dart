import 'package:flutter/material.dart';

class MissingUrlDialog extends StatelessWidget {
  const MissingUrlDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 500),
      title: Row(
        spacing: 10,
        children: [
          Icon(Icons.link_off, color: Theme.of(context).colorScheme.error),
          const Text("Missing Url"),
        ],
      ),
      content: const Text(
        "This serie isn't reachable because the server couldn't return a url for it.\n\nYou can try another source or another server until the server's administrator fixes this.",
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
