import 'package:app/common/utils/text_formatter.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:app/pokemon/presentation/pokemon_bloc.dart';
import 'package:app/pokemon/presentation/components/custom_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class PokemonButtonList extends StatelessWidget {
  final PokemonList data;
  final PokemonBloc bloc;
  final int index;

  const PokemonButtonList({
    Key? key,
    required this.data,
    required this.bloc,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        TextFormatter.capitalizeFirstChar(word: data.results[index].name),
      ),
      style: ElevatedButton.styleFrom(
        alignment: Alignment.centerLeft,
        primary: Colors.white,
        onPrimary: Colors.black54,
        textStyle: const TextStyle(fontSize: 24),
        padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
        elevation: 0,
      ),
      onPressed: () => CustomModalBottomSheet.show(
        context,
        bloc,
        data.results[index].url,
      ),
    );
  }
}
