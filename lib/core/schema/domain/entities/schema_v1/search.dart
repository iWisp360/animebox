import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.g.dart';
part 'search.freezed.dart';

@Freezed(toJson: false)
abstract class SearchV1 with _$SearchV1 {
  const factory SearchV1({
    @JsonKey(name: "data") required List<SearchResultsV1> results,
    required int fetchDate,
  }) = _SearchV1;

  factory SearchV1.fromJson(Map<String, dynamic> json) =>
      _$SearchV1FromJson(json);
}

@Freezed(toJson: false)
abstract class SearchResultsV1 with _$SearchResultsV1 {
  const factory SearchResultsV1({String? name, String? url, String? image}) =
      _SearchResultsV1;

  factory SearchResultsV1.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsV1FromJson(json);
}

@Freezed(fromJson: false, toJson: true)
abstract class SearchVariablesV1 with _$SearchVariablesV1 {
  const factory SearchVariablesV1({
    required String pattern,
    required String sourceId,
  }) = _SearchVariablesV1;
}

const searchQueryV1 = """
    query Search(\$pattern: String!, \$sourceId: ID!) { 
      Search(pattern: \$pattern, sourceId: \$sourceId) { 
        data { 
          url 
          name 
          image
        } 
        fetchDate 
      }
    }
  """;
