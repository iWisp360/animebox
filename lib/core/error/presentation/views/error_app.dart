import 'package:animebox/core/error/presentation/views/error_page.dart';
import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  final Exception exception;
  final StackTrace? stackTrace;
  const ErrorApp({super.key, required this.exception, this.stackTrace});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ErrorPage(
        isRecoverable: false,
        exception: exception,
        stackTrace: stackTrace,
      ),
    );
  }
}
