import 'package:flutter/material.dart';
import 'package:pokedex/app/core/helpers/poketype_helper.dart';
import 'package:pokedex/app/core/widgets/animated_widgets/pokeball_rotate.dart';
import 'package:pokedex/app/core/widgets/animated_widgets/resize_on_tap_widget.dart';

class PokemonDisplayCard extends StatelessWidget {
  final String pokemonType;
  final String pokemonImage;
  const PokemonDisplayCard({
    Key? key,
    required this.pokemonType,
    required this.pokemonImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.5,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: PoketypeHelper.getPokeColorByString(pokemonType),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.elliptical(250, 100),
          bottomRight: Radius.elliptical(250, 100),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            left: -50,
            child: PokeballRotate(size: screenSize.height * 0.35),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.1),
            child: ResizeOnTapWidget(
              enabled: false,
              begin: 0.4,
              child: Center(
                child: pokemonImage != ''
                    ? Image.network(
                        pokemonImage,
                        fit: BoxFit.fitHeight,
                      )
                    : const Padding(
                        padding: EdgeInsets.all(50),
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
