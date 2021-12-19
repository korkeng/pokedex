import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';

class Type {
  int slot;
  NamedAPIResource type;

  Type({
    required this.slot,
    required this.type,
  });

  static Type fromJson(Map<String, dynamic> json) {
    return Type(
      slot: json['slot'],
      type: NamedAPIResource.fromJson(json['type']),
    );
  }
}
