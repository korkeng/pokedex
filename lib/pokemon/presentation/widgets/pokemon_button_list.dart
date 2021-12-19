import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:app/pokemon/presentation/pokemon_bloc.dart';
import 'package:app/pokemon/presentation/widgets/custom_modal_buttom_sheet.dart';
import 'package:flutter/material.dart';

class PokemonButtonList extends StatelessWidget {
  final PokemonList data;
  final PokemonBloc bloc;

  const PokemonButtonList({
    Key? key,
    required this.data,
    required this.bloc,
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
            textStyle: const TextStyle(fontSize: 24),
            padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
            elevation: 0,
          ),
          onPressed: () => CustomModalButtomSheet.show(
            context,
            bloc,
            data.results[index].url,
          ),
        );
      },
    );
  }
}
