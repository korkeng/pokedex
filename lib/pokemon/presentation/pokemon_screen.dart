import 'package:app/common/constants/text_constants.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_detail_response.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:app/pokemon/presentation/pokemon_bloc.dart';
import 'package:app/pokemon/presentation/widgets/pokemon_button_list.dart';
import 'package:flutter/material.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final PokemonBloc _pokemonBloc = PokemonBloc(
    initialPokemonList: PokemonList.initValue(),
    initialPokemonDetail: PokemonDetail.initValue(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.titlePage),
      ),
      body: StreamBuilder(
        stream: _pokemonBloc.pokemonListStream,
        builder: (context, AsyncSnapshot<PokemonList> snapshot) {
          if (snapshot.hasData) {
            PokemonList? _pokemonList = snapshot.data;
            if (_pokemonList != null) {
              return SafeArea(
                child: PokemonButtonList(
                  data: _pokemonList,
                  bloc: _pokemonBloc,
                ),
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    _pokemonBloc.dispose();
    super.dispose();
  }
}
