import 'package:app/common/constants/text_constants.dart';
import 'package:flutter/material.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.titlePage),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
