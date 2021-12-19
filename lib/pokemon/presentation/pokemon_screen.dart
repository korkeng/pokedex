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
    initialPokemonList: PokemonList.init(),
    initialPokemonDetail: PokemonDetail.init(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.titlePage),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _pokemonBloc.pullToRefresh();
        },
        child: StreamBuilder(
          stream: _pokemonBloc.pokemonListStream,
          builder: (context, AsyncSnapshot<PokemonList> snapshot) {
            if (snapshot.hasData) {
              PokemonList? _pokemonList = snapshot.data;
              if (_pokemonList != null) {
                return SafeArea(
                  child: ListView.builder(
                    controller: _pokemonBloc.scrollController,
                    itemCount: _pokemonList.results.length,
                    itemBuilder: (context, index) {
                      return PokemonButtonList(
                        data: _pokemonList,
                        bloc: _pokemonBloc,
                        index: index,
                      );
                    },
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pokemonBloc.dispose();
    super.dispose();
  }
}
