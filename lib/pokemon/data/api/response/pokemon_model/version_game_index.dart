import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';

class VersionGameIndex {
  late int gameIndex;
  late NamedAPIResource version;

  VersionGameIndex({
    required this.gameIndex,
    required this.version,
  });

  static VersionGameIndex fromJson(Map<String, dynamic> json) {
    return VersionGameIndex(
      gameIndex: json['game_index'],
      version: NamedAPIResource.fromJson(json['version']),
    );
  }
}
