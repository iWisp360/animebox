// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Search _$SearchFromJson(Map<String, dynamic> json) => _Search(
  results: (json['data'] as List<dynamic>)
      .map((e) => SearchResults.fromJson(e as Map<String, dynamic>))
      .toList(),
  fetchDate: (json['fetchDate'] as num).toInt(),
);

_SearchResults _$SearchResultsFromJson(Map<String, dynamic> json) =>
    _SearchResults(
      name: json['name'] as String?,
      url: json['url'] as String?,
      image: json['image'] as String?,
    );
