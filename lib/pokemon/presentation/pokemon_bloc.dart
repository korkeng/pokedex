import 'package:app/pokemon/data/api/api_provider.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc {
  PokemonList initialPokemonList = PokemonList.initValue();
  late BehaviorSubject<PokemonList> _subjectPokemon;

  PokemonBloc({initialPokemonList}) {
    _subjectPokemon = BehaviorSubject<PokemonList>.seeded(initialPokemonList);
    fetchPokemonList(null);
  }

  Stream<PokemonList> get pokemonStream => _subjectPokemon.stream;

  Future<void> fetchPokemonList(String? nextUrl) async {
    initialPokemonList = await ApiProvider().fetchPokemonList(nextUrl);
    _subjectPokemon.sink.add(initialPokemonList);
  }

  void dispose() {
    _subjectPokemon.close();
  }
}
