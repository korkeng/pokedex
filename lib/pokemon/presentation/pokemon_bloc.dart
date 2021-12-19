import 'package:app/pokemon/data/api/api_provider.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_detail_response.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc {
  final ApiProvider _apiProvider = ApiProvider();

  PokemonList initialPokemonList = PokemonList.init();
  PokemonDetail initialPokemonDetail = PokemonDetail.init();

  ScrollController scrollController = ScrollController();
  late BehaviorSubject<PokemonList> _subjectPokemonList;
  late BehaviorSubject<PokemonDetail> _subjectPokemonDetail;

  String? _nextUrl = '';

  PokemonBloc({initialPokemonList, initialPokemonDetail, controller}) {
    _subjectPokemonList =
        BehaviorSubject<PokemonList>.seeded(initialPokemonList);
    _subjectPokemonDetail =
        BehaviorSubject<PokemonDetail>.seeded(initialPokemonDetail);
    scrollController = scrollController;

    reachToEndScreen();
    fetchPokemonList(null);
  }

  void setNextUrl(String? nextUrl) {
    _nextUrl = nextUrl;
  }

  void reachToEndScreen() {
    scrollController.addListener(() {
      double _maxScroll = scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels == _maxScroll) {
        fetchPokemonList(_nextUrl);
      }
    });
  }

  Stream<PokemonList> get pokemonListStream => _subjectPokemonList.stream;
  Stream<PokemonDetail> get pokemonDetailStream => _subjectPokemonDetail.stream;

  Future<void> fetchPokemonList(String? nextUrl) async {
    late List<NamedAPIResource> _oldPokemonNameAPIResource;
    if (initialPokemonList != PokemonList.init()) {
      _oldPokemonNameAPIResource = initialPokemonList.results;
    }
    initialPokemonList = await _apiProvider.fetchPokemonList(nextUrl);
    List<NamedAPIResource> newPokemonNameAPIResource =
        List.from(_oldPokemonNameAPIResource)
          ..addAll(initialPokemonList.results);

    initialPokemonList.results = newPokemonNameAPIResource;
    setNextUrl(initialPokemonList.next);
    _subjectPokemonList.sink.add(initialPokemonList);
  }

  Future<void> pullToRefresh() async {
    initialPokemonList = PokemonList.init();
    fetchPokemonList(null);
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
