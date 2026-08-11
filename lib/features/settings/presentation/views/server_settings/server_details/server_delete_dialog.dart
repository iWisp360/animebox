import 'package:flutter/material.dart';

class ServerDeleteDialog extends StatelessWidget {
  const ServerDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 400),
      title: const Text("Delete server"),
      content: const Text(
        "This server will be permanently deleted from Anime Box. The series you added from this server won't be deleted.",
      ),
      actions: [
        FilledButton.tonal(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text("Delete"),
        ),
        FilledButton.tonal(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
