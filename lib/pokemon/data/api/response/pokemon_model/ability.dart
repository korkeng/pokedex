import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';

class Ability {
  bool isHidden;
  int slot;
  NamedAPIResource ability;

  Ability({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  static Ability fromJson(Map<String, dynamic> json) {
    return Ability(
      isHidden: json['is_hidden'],
      slot: json['slot'],
      ability: NamedAPIResource.fromJson(json['ability']),
    );
  }
}
