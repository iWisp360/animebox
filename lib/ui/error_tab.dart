import 'dart:math';

import 'package:animebox/core/logging.dart';
import 'package:animebox/ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CopyState { copied, spam, idle }

class ErrorTab extends StatefulWidget {
  final bool isRecoverable;
  final Exception exception;
  final StackTrace? stackTrace;
  const ErrorTab({
    super.key,
    required this.isRecoverable,
    required this.exception,
    this.stackTrace,
  });

  @override
  State<ErrorTab> createState() => _ErrorTabState();
}

class _ErrorTabState extends State<ErrorTab> {
  var copyState = CopyState.idle;
  String errorQuote = randomErrorQuote();

  @override
  void initState() {
    super.initState();

    logger.e(
      "I, the error tab, just appeared!\n${widget.exception}\n${widget.stackTrace}",
    );
  }

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

                        setState(() {
                          copyState = CopyState.copied;
                        });

                        await Future.delayed(const Duration(seconds: 3));

                        if (mounted) {
                          setState(() {
                            copyState = CopyState.idle;
                          });
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

const List<String> quotes = [
  "Houston, we’ve had a problem.",
  "I'm sorry, Dave. I'm afraid I can't do that.",
  "Well, this is awkward.",
  "Computer says no.",
  "That wasn't supposed to happen.",
  "A wild error appeared!",
  "Everything is fine. Keep calm.",
  "The wheels have completely come off.",
  "We’ve entered uncharted territory.",
  "System status: Total containment breach.",
  "It's not you, it's our code.",
];

String randomErrorQuote() => quotes[Random().nextInt(quotes.length)];
