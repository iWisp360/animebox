import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.g.dart';

@JsonSerializable(createToJson: false)
class GraphqlResponse {
  final Map<String, dynamic>? data;
  final List<dynamic>? errors;

  GraphqlResponse({this.errors, this.data});

  factory GraphqlResponse.fromJson(Map<String, dynamic> json) =>
      _$GraphqlResponseFromJson(json);
}
