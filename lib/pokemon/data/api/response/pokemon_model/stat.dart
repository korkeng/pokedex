import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';

class Stat {
  NamedAPIResource stat;
  int effort;
  int baseStat;

  Stat({
    required this.stat,
    required this.effort,
    required this.baseStat,
  });

  static Stat fromJson(Map<String, dynamic> json) {
    return Stat(
      stat: NamedAPIResource.fromJson(json['stat']),
      effort: json['effort'],
      baseStat: json['base_stat'],
    );
  }
}
