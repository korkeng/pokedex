import 'package:app/pokemon/data/api/api_provider.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_detail_response.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc {
  final ApiProvider _apiProvider = ApiProvider();

  PokemonList initialPokemonList = PokemonList.initValue();
  PokemonDetail initialPokemonDetail = PokemonDetail.initValue();

  late BehaviorSubject<PokemonList> _subjectPokemonList;
  late BehaviorSubject<PokemonDetail> _subjectPokemonDetail;

  PokemonBloc({initialPokemonList, initialPokemonDetail}) {
    _subjectPokemonList =
        BehaviorSubject<PokemonList>.seeded(initialPokemonList);
    _subjectPokemonDetail =
        BehaviorSubject<PokemonDetail>.seeded(initialPokemonDetail);
    fetchPokemonList(null);
  }

  Stream<PokemonList> get pokemonListStream => _subjectPokemonList.stream;
  Stream<PokemonDetail> get pokemonDetailStream => _subjectPokemonDetail.stream;

  Future<void> fetchPokemonList(String? nextUrl) async {
    initialPokemonList = await _apiProvider.fetchPokemonList(nextUrl);
    _subjectPokemonList.sink.add(initialPokemonList);
  }

  Future<void> displayPokemonDetail(String url) async {
    initialPokemonDetail = await _apiProvider.fetchPokemonDetail(url);
    _subjectPokemonDetail.sink.add(initialPokemonDetail);
  }

  void dispose() {
    _subjectPokemonList.close();
    _subjectPokemonDetail.close();
  }
}
