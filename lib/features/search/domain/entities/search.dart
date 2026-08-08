class Search {
  final List<Result> results;
  final int fetchDate;

  Search({required this.results, required this.fetchDate});
}

class Result {
  final String? name;
  final String? url;
  final String? image;

  Result({this.url, this.name, this.image});
}
