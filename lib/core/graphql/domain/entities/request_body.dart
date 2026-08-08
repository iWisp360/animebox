import 'package:json_annotation/json_annotation.dart';

part 'request_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class GraphqlRequestBody {
  final String query;
  final Map<String, dynamic>? variables;

  GraphqlRequestBody({required this.query, this.variables});
  Map<String, dynamic> toJson() => _$GraphqlRequestBodyToJson(this);
}
