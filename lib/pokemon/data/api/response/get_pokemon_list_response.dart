class PokemonList {
  int count;
  String? next;
  String? previous;
  List<Result> results;

  PokemonList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  static PokemonList initValue() {
    return PokemonList(
      count: 0,
      results: [],
    );
  }

  static PokemonList fromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((_) => Result.fromJson(_ as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Result {
  String name;
  String url;

  Result({
    required this.name,
    required this.url,
  });

  static Result fromJson(Map<String, dynamic> json) {
    return Result(
      name: json['name'],
      url: json['url'],
    );
  }
}
