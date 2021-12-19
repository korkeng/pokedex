import 'package:app/pokemon/data/api/response/pokemon_model/home.dart';
import 'package:app/pokemon/data/api/response/pokemon_model/sprite.dart';

class Other {
  Sprite dreamWorld;
  Home home;
  Sprite officialArtwork;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  static Other fromJson(Map<String, dynamic> json) {
    return Other(
      dreamWorld: Sprite.fromJson(json['dream_world']),
      home: Home.fromJson(json['home']),
      officialArtwork: Sprite.fromJson(json['official-artwork']),
    );
  }
}
