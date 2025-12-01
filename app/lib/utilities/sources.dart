import "dart:convert";
import "dart:io";

import "package:json_annotation/json_annotation.dart";
import "package:oxanime/utilities/http.dart";
import "package:oxanime/utilities/logs.dart";
import "package:path/path.dart" as path;
import "package:path_provider/path_provider.dart";

part "sources.g.dart";

late List<Source> sources;

@JsonSerializable()
class Source {
  @JsonKey(defaultValue: false)
  bool? searchSerieUrlResultsAbsolute;
  @JsonKey(defaultValue: false)
  bool? searchSerieNameHasSplitPattern;
  String? searchSerieNameSplitPattern;
  List<String>? searchSerieNameExcludes;
  List<String>? searchSerieDescriptionExcludes;
  final String name;
  final String mainUrl;
  final String searchUrl;
  final String searchSerieNameCSSClass;
  final String searchSerieUrlCSSClass;
  final String searchSerieImageCSSClass;
  final String searchSerieChaptersCSSClass;
  final String searchSerieDescriptionCSSClass;
  @JsonKey(defaultValue: false)
  final bool enabled;
  @JsonKey(disallowNullValue: true)
  final String uuid;

  Source({
    this.name = "OxAnime Source",
    this.searchSerieNameExcludes,
    this.searchSerieUrlResultsAbsolute,
    this.searchSerieNameHasSplitPattern,
    this.searchSerieNameSplitPattern,
    required this.searchSerieNameCSSClass,
    required this.mainUrl,
    required this.searchUrl,
    required this.searchSerieUrlCSSClass,
    required this.searchSerieImageCSSClass,
    required this.searchSerieChaptersCSSClass,
    required this.searchSerieDescriptionCSSClass,
    this.searchSerieDescriptionExcludes,
    this.enabled = false,
    required this.uuid,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  static Future<List<Source>> getSources() async {
    final sourcesPath = await SourceManager().getSourcesPath();

    try {
      List<Source> sources = [];
      final String fileContents = await File(sourcesPath).readAsString();
      final serializedContents = jsonDecode(fileContents);
      for (var source in serializedContents) {
        sources.add(Source.fromJson(source));
      }
      return sources.where((source) => source.isUsable()).toList();
    } catch (e) {
      logger.e("Error while reading sources: $e");
      rethrow;
    }
  }

  Future<Source?> getDuplicate(List<Source> sources) async {
    for (var source in sources) {
      if (source.name.toLowerCase() == name.toLowerCase() ||
          source.uuid == uuid ||
          mainUrl.contains(source.name.toLowerCase())) {
        return source;
      }
    }
    return null;
  }

  Future<String?> getSerieDescription(final String responseBody) async {
    return await (await SourceHtmlParser.create(
      html: responseBody,
    )).getSerieCSSClassText(searchSerieDescriptionCSSClass, searchSerieDescriptionExcludes ?? []);
  }

  Future<String?> getSerieName(final String responseBody) async {
    return await (await SourceHtmlParser.create(
      html: responseBody,
    )).getSerieCSSClassText(searchSerieNameCSSClass, searchSerieNameExcludes ?? []);
  }

  bool isUsable() {
    bool result = (enabled == true)
        ? (uuid.isNotEmpty)
              ? true
              : false
        : false;
    logger.i((result == false) ? "$name is not usable" : "$name is usable");
    return false;
  }

  Future push(List<Source> localSources) async {
    final sourcesPath = await SourceManager().getSourcesPath();

    try {
      final serializedSource = toJson();
      final fileContents = await SourceManager().readSourcesFile();
      List<Map<String, dynamic>> serializedSources = jsonDecode(fileContents);
      final conflict = await getDuplicate(localSources);
      if (conflict != null) {
        throw Exception(
          "Not adding $name with UUID $name as it is a duplicate of ${conflict.name} with UUID ${conflict.uuid}",
        );
      }
      sources.add(this);
      serializedSources.add(serializedSource);
      final deserializedSources = jsonEncode(serializedSources);
      await File(sourcesPath).writeAsString(deserializedSources);
    } catch (e, s) {
      logger.e("Error while pushing source $name to $sourcesPath\n$s");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

class SourceManager {
  Future<String> getSourcesPath() async {
    String sourcesPath = path.join(
      await getApplicationSupportDirectory().then((value) => value.path),
      "sources.json",
    );
    logger.i("Sources are located at $sourcesPath");
    return sourcesPath;
  }

  Future<String> readSourcesFile() async {
    try {
      final sourcesPath = await getSourcesPath();
      final sourcesFile = File(sourcesPath);
      final StringBuffer fileContents = StringBuffer();
      await for (var chunk in utf8.decoder.bind(sourcesFile.openRead())) {
        fileContents.write(chunk);
      }
      return fileContents.toString();
    } catch (e) {
      logger.e("Error while reading sources file: $e");
      rethrow;
    }
  }
}
