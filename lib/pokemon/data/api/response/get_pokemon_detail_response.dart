import 'package:app/pokemon/data/api/response/pokemon_model/import_all_model.dart';

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
