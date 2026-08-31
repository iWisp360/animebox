import 'package:animebox/core/servers/presentation/providers/servers_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetServersButton extends ConsumerWidget {
  const ResetServersButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: .all(Theme.of(context).colorScheme.error),
      ),
      onPressed: () async =>
          await ref.read(serversListProvider.notifier).resetServerList(),
      child: Text(
        "Reset Server List",
        style: TextStyle(color: Theme.of(context).colorScheme.onError),
      ),
    );
  }
}
