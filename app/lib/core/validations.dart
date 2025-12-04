import 'package:oxanime/core/constants.dart';
import 'package:oxanime/core/logs.dart';
import 'package:oxanime/domain/sources.dart';
import 'package:uuid/uuid.dart';
import "package:oxanime/core/enums.dart";

class Validate {
  static bool source(Source source) {
    if (source.uuid == PlaceHolders.uuid ||
        !Uuid.isValidUUID(fromString: source.uuid) ||
        source.mainUrl.isEmpty ||
        source.searchUrl.isEmpty ||
        source.chaptersVideosUrlParseMode == SourceVideosUrlParseModes.empty ||
        source.uuid.isEmpty) {
      logger.w(
        "Source ${source.name} is not valid. Required fields are:\n${RequiredValues.forSources}",
      );
      return false;
    }
    return true;
  }
}
