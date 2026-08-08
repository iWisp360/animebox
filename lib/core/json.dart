import 'dart:convert';

JsonEncoder prettyEncoder() {
  return JsonEncoder.withIndent("  ");
}
