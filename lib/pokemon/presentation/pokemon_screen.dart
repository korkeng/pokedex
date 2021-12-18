import 'package:app/common/constants/text_constants.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:app/pokemon/presentation/pokemon_bloc.dart';
import 'package:flutter/material.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final PokemonBloc _pokemonBloc = PokemonBloc(
    initialPokemonList: PokemonList.initValue(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.titlePage),
      ),
      body: StreamBuilder(
        stream: _pokemonBloc.pokemonStream,
        builder: (context, AsyncSnapshot<PokemonList> snapshot) {
          if (snapshot.hasData) {
            PokemonList? _pokemonList = snapshot.data;
            if (_pokemonList != null) {
              return SafeArea(
                child: ListView.builder(
                  itemCount: _pokemonList.results.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      child: Text(_pokemonList.results[index].name),
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        primary: Colors.white,
                        onPrimary: Colors.black54,
                        elevation: 0,
                        textStyle: const TextStyle(fontSize: 24),
                        padding: const EdgeInsets.only(
                          left: 8,
                          top: 16,
                          bottom: 16,
                        ),
                      ),
                      onPressed: () {},
                    );
                  },
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
