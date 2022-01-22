import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/cards/pokemon_card.dart';
import 'package:pokedex/app/core/widgets/fields/search_field.dart';
import 'package:pokedex/app/core/widgets/scaffolds/custom_scroll_scaffold.dart';

import 'poke_list_controller.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  _PokeListPageState createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  final controller = Modular.get<PokeListController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollScaffold(
      backgroundColor: PokeColors.grey1,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 50, bottom: 20),
              child: Text(
                'Pokédex',
                style: GoogleFonts.encodeSans(
                  color: PokeColors.red2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SearchField(),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(right: 50),
          child: Text(
            'A Pokédex contém estatísticas detalhadas para cada criatura dos jogos Pokémon',
            style: GoogleFonts.encodeSans(
              color: PokeColors.grey3,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...List.generate(
          2,
          (index) {
            return RxBuilder(
              builder: (context) {
                return _listItem(controller.pokemon );
              }
            );
          },
        ),
      ],
    );
  }

  Widget _listItem(PokemonModel pokemon) => Column(
        children: [
          PokemonCard(
            image: pokemon.sprites.frontDefault,
            name: 'Bulbasaur',
            number: '001',
            types: const [
              'fire',
              'fairy',
              'steel',
              'dragon',
            ],
          ),
        ],
      );
}
