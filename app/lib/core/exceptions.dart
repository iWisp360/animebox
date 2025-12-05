String _throwError(final Object errorMsg, final StackTrace stackTrace) {
  return "$errorMsg\n$stackTrace";
}

class SourceException implements Exception {
  final SourceExceptionKind kind;
  final Object errorMsg;
  StackTrace stackTrace;
  SourceException({
    required this.errorMsg,
    required this.stackTrace,
    this.kind = SourceExceptionKind.otherException,
  });

  @override
  String toString() => switch (kind) {
    SourceExceptionKind.gotPlaceHolderException =>
      "Error while processing source: Source is a placeholder, "
          "probably a source couldn't be assigned or getting sources failed"
          "\n$errorMsg\n$stackTrace",

    SourceExceptionKind.otherException => "Error while processing source",
  };
}

enum SourceExceptionKind { gotPlaceHolderException, otherException }

class VideoUrlParserException implements Exception {
  final VideoUrlParserExceptionKind kind;
  final Object errorMsg;
  StackTrace stackTrace;
  VideoUrlParserException({
    this.kind = VideoUrlParserExceptionKind.otherException,
    required this.errorMsg,
    required this.stackTrace,
  });

  @override
  String toString() => switch (kind) {
    VideoUrlParserExceptionKind.requestMakeException =>
      "Error while creating request for Video Url: ${_throwError(errorMsg, stackTrace)}",
    VideoUrlParserExceptionKind.responseReceiveException =>
      "Error while getting response from Video Url: ${_throwError(errorMsg, stackTrace)}",
    VideoUrlParserExceptionKind.responseParseException =>
      "Error while parsing response from Video Url: ${_throwError(errorMsg, stackTrace)}",
    VideoUrlParserExceptionKind.otherException =>
      "Error from a video url parser: ${_throwError(errorMsg, stackTrace)}",
  };
}

enum VideoUrlParserExceptionKind {
  requestMakeException,
  responseReceiveException,
  responseParseException,
  otherException,
}
