import 'package:app/pokemon/data/api/api_provider.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc {
  PokemonList initialPokemonList = PokemonList.initValue();
  late BehaviorSubject<PokemonList> _subjectPokemon;

  PokemonBloc({initialPokemonList}) {
    _subjectPokemon = BehaviorSubject<PokemonList>.seeded(initialPokemonList);
    fetchPokemonList();
  }

  Stream<PokemonList> get pokemonStream => _subjectPokemon.stream;

  void fetchPokemonList() async {
    initialPokemonList = await ApiProvider().fetchPokemonList();
    _subjectPokemon.sink.add(initialPokemonList);
  }

  void dispose() {
    _subjectPokemon.close();
  }
}
