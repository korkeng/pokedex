import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:flutter/material.dart';

class PokemonButtonList extends StatelessWidget {
  final void Function() onPress;
  final PokemonList data;

  const PokemonButtonList({
    Key? key,
    required this.data,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.results.length,
      itemBuilder: (_, index) {
        return ElevatedButton(
          child: Text(data.results[index].name),
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
          onPressed: onPress,
        );
      },
    );
  }
}
