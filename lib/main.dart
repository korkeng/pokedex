import 'package:app/pokemon/presentation/pokemon_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokemonScreen(),
    );
  }
}