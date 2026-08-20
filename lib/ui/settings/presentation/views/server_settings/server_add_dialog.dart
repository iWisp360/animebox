import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/core/servers/data/providers.dart';
import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerAddDialog extends ConsumerStatefulWidget {
  const ServerAddDialog({super.key});

  @override
  ConsumerState<ServerAddDialog> createState() => _ServerAddDialogState();
}

class _ServerAddDialogState extends ConsumerState<ServerAddDialog> {
  String? errorText;
  bool loadingServer = false;
  bool validUrl = false;
  late TextEditingController textEditingController;
  String actualText = "";

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translations = ref.watch(i18nProvider);
    final addServerDialogTranslations =
        translations.settings.servers.addServerDialog;

    return AlertDialog(
      title: Text(addServerDialogTranslations.action),
      content: TextFormField(
        onFieldSubmitted: (url) async {
          setState(() => loadingServer = true);

          try {
            final server = await doSubmit(textEditingController.text);
            if (context.mounted) {
              Navigator.of(context).pop(server);
            }
          } catch (e) {
            setState(() => errorText = e.toString());
          } finally {
            setState(() => loadingServer = false);
          }
        },
        decoration: InputDecoration(
          errorText: errorText,
          errorMaxLines: 10,
          labelText: addServerDialogTranslations.formLabel,
        ),
        controller: textEditingController,
        onChanged: (text) => setState(() {
          try {
            Uri.parse(text);
            validUrl = true;
          } catch (e) {
            validUrl = false;
          }

          actualText = text;
          errorText = null;
        }),
      ),
      constraints: const .new(minWidth: 300, maxWidth: .infinity),
      actions: [
        FilledButton(
          onPressed: (!loadingServer && actualText.isNotEmpty && validUrl)
              ? () async {
                  setState(() => loadingServer = true);

                  try {
                    final server = await doSubmit(textEditingController.text);
                    if (context.mounted) {
                      Navigator.of(context).pop(server);
                    }
                  } catch (e) {
                    setState(() => errorText = e.toString());
                  } finally {
                    setState(() => loadingServer = false);
                  }
                }
              : null,
          child: loadingServer
              ? const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(),
                )
              : Text(translations.commonActions.add),
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(translations.commonActions.cancel),
        ),
      ],
    );
  }

  Future<Server> doSubmit(String url) async {
    errorText = null;
    try {
      final server = await ref
          .read(serverListProvider.notifier)
          .addServer(url: url);

      return server;
    } catch (e) {
      rethrow;
    }
  }
}
