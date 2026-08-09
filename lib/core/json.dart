import 'dart:convert';

JsonEncoder prettyEncoder() {
  return const JsonEncoder.withIndent("  ");
}

JsonDecoder jsonDecoder() {
  return const JsonDecoder();
}
