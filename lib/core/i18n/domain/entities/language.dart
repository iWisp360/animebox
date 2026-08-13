enum Language {
  en(nativeName: "English"),
  es(nativeName: "Español"),
  system;

  final String? nativeName;

  const Language({this.nativeName});
}
