import 'package:app/pokemon/data/api/response/model/generation.dart';
import 'package:app/pokemon/data/api/response/model/generation_game_version.dart';
import 'package:app/pokemon/data/api/response/model/named_api_resource.dart';
import 'package:app/pokemon/data/api/response/model/sprite.dart';
import 'package:app/pokemon/data/api/response/model/version_game_index.dart';

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

class HeldItem {
  NamedAPIResource item;
  List<VersionDetail> versionDetails;

  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  static HeldItem fromJson(Map<String, dynamic> json) {
    return HeldItem(
      item: NamedAPIResource.fromJson(json['item']),
      versionDetails: (json['version_details'] as List<dynamic>)
          .map((e) => VersionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class VersionGroupDetail {
  NamedAPIResource moveLearnMethod;
  NamedAPIResource versionGroup;
  int levelLearnedAt;

  VersionGroupDetail({
    required this.moveLearnMethod,
    required this.versionGroup,
    required this.levelLearnedAt,
  });

  static VersionGroupDetail fromJson(Map<String, dynamic> json) {
    return VersionGroupDetail(
      moveLearnMethod: NamedAPIResource.fromJson(json['move_learn_method']),
      versionGroup: NamedAPIResource.fromJson(json['version_group']),
      levelLearnedAt: json['level_learned_at'],
    );
  }
}

class Move {
  NamedAPIResource move;
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  static Move fromJson(Map<String, dynamic> json) {
    return Move(
      move: NamedAPIResource.fromJson(json['move']),
      versionGroupDetails: (json['version_group_details'] as List<dynamic>)
          .map((e) => VersionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Home {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
  });

  static Home fromJson(Map<String, dynamic> json) {
    return Home(
      frontDefault: json['frontDefault'],
      frontShiny: json['frontShiny'],
      frontFemale: json['frontFemale'],
      frontShinyFemale: json['frontShinyFemale'],
    );
  }
}

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

// Need to change name becuase duplicate with other sprite
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

class PokemonDetail {
  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  List<Ability> abilities;
  List<NamedAPIResource> forms;
  List<VersionGameIndex> gameIndices;
  List<HeldItem> heldItems;
  String locationAreaEncounters;
  List<Move> moves;
  SpriteFile sprites;
  NamedAPIResource species;
  List<Stat> stats;
  List<Type> types;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.sprites,
    required this.species,
    required this.stats,
    required this.types,
  });

  static PokemonDetail init() {
    return PokemonDetail(
        abilities: [],
        baseExperience: 0,
        forms: [],
        gameIndices: [],
        height: 0,
        heldItems: [],
        id: 0,
        isDefault: false,
        locationAreaEncounters: '',
        moves: [],
        name: '',
        order: 0,
        species: NamedAPIResource(name: '', url: ''),
        sprites: SpriteFile(
          other: Other(
            dreamWorld: Sprite(),
            home: Home(),
            officialArtwork: Sprite(),
          ),
          versions: GenerationGameVersions(
              generationI: GenerationI(
                redGreenBlue: Sprite(),
                yellow: Sprite(),
              ),
              generationII: GenerationII(
                crystal: Sprite(),
                gold: Sprite(),
                silver: Sprite(),
              ),
              generationIII: GenerationIII(
                emerald: Sprite(),
                fireredLeafgreen: Sprite(),
                rubySapphire: Sprite(),
              ),
              generationIV: GenerationIV(
                  diamondPearl: Sprite(),
                  heartgoldSoulsilver: Sprite(),
                  platinum: Sprite()),
              generationV: GenerationV(
                blackWhite: AnimatedSprite(animated: Sprite()),
              ),
              generationVI: GenerationVI(
                omegarubyAlphasapphire: Sprite(),
                xy: Sprite(),
              ),
              generationVII: GenerationVII(
                icons: Sprite(),
                ultraSunUltraMoon: Sprite(),
              ),
              generationVIII: GenerationVIII(
                icons: Sprite(),
              )),
        ),
        stats: [],
        types: [],
        weight: 0);
  }

  static PokemonDetail fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      isDefault: json['is_default'],
      order: json['order'],
      weight: json['weight'],
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      forms: (json['forms'] as List<dynamic>)
          .map((e) => NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameIndices: (json['game_indices'] as List<dynamic>)
          .map((e) => VersionGameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      heldItems: (json['held_items'] as List<dynamic>)
          .map((e) => HeldItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      locationAreaEncounters: json['location_area_encounters'],
      moves: (json['moves'] as List<dynamic>)
          .map((e) => Move.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: SpriteFile.fromJson(json['sprites']),
      species: NamedAPIResource.fromJson(json['species']),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
