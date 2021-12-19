import 'package:app/pokemon/data/api/response/model/named_api_resource.dart';

class PokemonList {
  int count;
  String? next;
  String? previous;
  List<NamedAPIResource> results;

  PokemonList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  static PokemonList init() {
    return PokemonList(count: 0, results: []);
  }

  static PokemonList fromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((_) => NamedAPIResource.fromJson(_ as Map<String, dynamic>))
          .toList(),
    );
  }
}
