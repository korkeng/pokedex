import 'package:app/pokemon/data/api/api_provider.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_detail_response.dart';
import 'package:app/pokemon/presentation/pokemon_bloc.dart';
import 'package:app/pokemon/presentation/widgets/pokemon_detail_card.dart';
import 'package:flutter/material.dart';

class CustomModalButtomSheet {
  static void show(BuildContext context, PokemonBloc bloc, String url) {
    ApiProvider _apiProvider = ApiProvider();
    bloc.displayPokemonDetail(url);
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<PokemonDetail>(
          future: _apiProvider.fetchPokemonDetail(url),
          builder: (context, AsyncSnapshot<PokemonDetail> snapshot) {
            if (snapshot.hasData) {
              PokemonDetail? _pokemonDetail = snapshot.data;
              if (_pokemonDetail != null) {
                return PokemonDetailCard(
                  name: _pokemonDetail.name,
                  spriteFront: _pokemonDetail.sprites.frontDefault ?? '',
                  spriteBack: _pokemonDetail.sprites.backDefault ?? '',
                  weight: _pokemonDetail.weight,
                  height: _pokemonDetail.height,
                );
              }
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
