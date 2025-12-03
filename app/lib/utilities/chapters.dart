import "package:json_annotation/json_annotation.dart";

part "chapters.g.dart";

@JsonSerializable()
class Chapter {
  final String identifier;
  final String url;
  Chapter({required this.identifier, required this.url});

  factory Chapter.fromJson(Map<String, dynamic> map) => _$ChapterFromJson(map);

  Map<String, dynamic> toMap() => _$ChapterToJson(this);
}
