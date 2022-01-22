import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/cards/option_card.dart';
import 'package:pokedex/app/core/widgets/cards/pokemon_card.dart';
import 'package:pokedex/app/core/widgets/fields/search_field.dart';
import 'package:pokedex/app/core/widgets/scaffolds/custom_scroll_scaffold.dart';

class DesignSystemPage extends StatefulWidget {
  const DesignSystemPage({Key? key}) : super(key: key);

  @override
  _DesignSystemPageState createState() => _DesignSystemPageState();
}

class _DesignSystemPageState extends State<DesignSystemPage> {
  final _cardColors = [
    PokeColors.green1,
    PokeColors.red1,
    PokeColors.blue1,
    PokeColors.yellow1,
    PokeColors.purple1,
    PokeColors.brown1,
  ];
  final _cardLabels = [
    'Pokedex',
    'Movimentos',
    'Habilidades',
    'Items',
    'Locais',
    'Type charts',
  ];
  final _functions = [
    () => debugPrint('a'),
    () => debugPrint('b'),
    () => debugPrint('c'),
    () => debugPrint('d'),
    () => debugPrint('e'),
    () => debugPrint('f'),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollScaffold(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Text(
            'Qual Pokémon você está procurando?',
            style: GoogleFonts.encodeSans(
              color: Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SearchField(),
        const SizedBox(height: 20),
        GridView.builder(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5 / 2,
            crossAxisCount: 2,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return OptionCard(
              label: _cardLabels[index],
              color: _cardColors[index],
              onTap: _functions[index],
            );
          },
        ),
        const PokemonCard(
          image:
              'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png',
          name: 'Bulbasaur',
          number: '001',
          types: [
            'fairy',
            'steel',
            'fire',
            'dragon',
          ],
        ),
        const SizedBox(height: 50),
        // const PokemonInfoMenu(),
      ],
    );
  }
}
