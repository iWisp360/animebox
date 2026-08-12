import 'package:animebox/core/error/presentation/controllers/error_page_controller.dart';
import 'package:animebox/core/helpers/convergence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorPage extends StatefulWidget {
  final bool isRecoverable;
  final Object exception;
  final StackTrace? stackTrace;
  const ErrorPage({
    super.key,
    required this.isRecoverable,
    required this.exception,
    this.stackTrace,
  });

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  var copyState = CopyState.idle;
  String errorQuote = ErrorPageController.randomErrorQuote();

  @override
  Widget build(BuildContext context) {
    final copyButtonText = switch (copyState) {
      CopyState.idle => "Copy error details",
      CopyState.copied => "Copied!",
      CopyState.spam => "Hey! You already copied the error!",
    };

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsGeometry.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: copyState == CopyState.spam
                  ? null
                  : () async {
                      if (copyState == CopyState.copied) {
                        setState(() {
                          copyState = CopyState.spam;
                        });
                      } else {
                        Clipboard.setData(
                          ClipboardData(
                            text: "${widget.exception}\n${widget.stackTrace}",
                          ),
                        );

                        setState(() => copyState = CopyState.copied);

                        await Future.delayed(const Duration(seconds: 3));

                        if (mounted) {
                          setState(() => copyState = CopyState.idle);
                        }
                      }
                    },
              child: Text(copyButtonText),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: widget.isRecoverable
            ? BackButton(onPressed: () => Navigator.of(context).pop())
            : null,
      ),
      body: Padding(
        padding: calculateDefaultPadding(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Whoops! Anime Box ${!widget.isRecoverable ? "crashed" : "failed"}!",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(errorQuote),
              const SizedBox(height: 20),
              Text("${widget.exception}"),
              const SizedBox(height: 20),
              widget.stackTrace != null
                  ? Text("Here's the stacktrace\n${widget.stackTrace}")
                  : const Text("No stacktrace was provided"),
            ],
          ),
        ),
      ),
    );
  }
}
