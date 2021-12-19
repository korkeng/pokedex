import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';

class VersionDetail {
  NamedAPIResource version;
  int rarity;

  VersionDetail({
    required this.version,
    required this.rarity,
  });

  static VersionDetail fromJson(Map<String, dynamic> json) {
    return VersionDetail(
        version: NamedAPIResource.fromJson(json['version']),
        rarity: json['rarity']);
  }
}
