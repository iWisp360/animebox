import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.g.dart';
part 'search.freezed.dart';

@Freezed(toJson: false)
abstract class Search with _$Search {
  const factory Search({
    @JsonKey(name: "data") required List<SearchResults> results,
    required int fetchDate,
  }) = _Search;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}

@Freezed(toJson: false)
abstract class SearchResults with _$SearchResults {
  const factory SearchResults({String? name, String? url, String? image}) =
      _SearchResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);
}
