import 'package:app/pokemon/data/api/response/pokemon_model/generation_game_version.dart';
import 'package:app/pokemon/data/api/response/pokemon_model/other.dart';

class SpriteFile {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;
  String? backDefault;
  String? backShiny;
  String? backFemale;
  String? backShinyFemale;
  Other other;
  GenerationGameVersions versions;

  SpriteFile({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
    required this.other,
    required this.versions,
  });

  static SpriteFile fromJson(Map<String, dynamic> json) {
    return SpriteFile(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      other: Other.fromJson(json['other']),
      versions: GenerationGameVersions.fromJson(json['versions']),
    );
  }
}
