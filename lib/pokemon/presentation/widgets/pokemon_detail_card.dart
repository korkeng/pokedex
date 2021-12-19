import 'package:app/common/constants/text_constants.dart';
import 'package:flutter/material.dart';

class PokemonDetailCard extends StatelessWidget {
  final String name;
  final String spriteFront;
  final String spriteBack;
  final int weight;
  final int height;

  const PokemonDetailCard({
    Key? key,
    required this.name,
    required this.spriteFront,
    required this.spriteBack,
    required this.weight,
    required this.height,
  }) : super(key: key);

  Widget _renderPokemonName() {
    return Text(name, style: const TextStyle(fontSize: 36));
  }

  Widget _imageFormatter({required String src}) {
    return Image.network(src, scale: 0.7);
  }

  Widget _renderPokemonSprite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imageFormatter(src: spriteFront),
        _imageFormatter(src: spriteBack),
      ],
    );
  }

  Widget _richTextFormatter({
    required String prefixWord,
    required int value,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: prefixWord,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: TextConstant.spacer + value.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _renderPokemonData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _richTextFormatter(prefixWord: TextConstant.weight, value: weight),
        const SizedBox(width: 16),
        _richTextFormatter(prefixWord: TextConstant.height, value: height),
      ],
    );
  }

  Widget _renderHeaderLine() {
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 24),
        child: Container(
          height: 5,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _renderHeaderLine(),
          _renderPokemonName(),
          const SizedBox(height: 32),
          _renderPokemonSprite(),
          const SizedBox(height: 32),
          _renderPokemonData(),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
