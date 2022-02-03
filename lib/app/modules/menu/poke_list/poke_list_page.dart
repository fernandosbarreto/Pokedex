import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/models/pokemon_info_model.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/cards/pokemon_card.dart';
import 'package:pokedex/app/core/widgets/fields/search_field.dart';
import 'package:pokedex/app/modules/menu/poke_list/poke_list_store.dart';

class NewPokeListPage extends StatefulWidget {
  const NewPokeListPage({Key? key}) : super(key: key);

  @override
  _NewPokeListPageState createState() => _NewPokeListPageState();
}

class _NewPokeListPageState extends State<NewPokeListPage> {
  final store = Modular.get<PokeListStore>();

  @override
  void initState() {
    store.getPokemonList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    store.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
            child: Text(
              'Pokédex',
              style: GoogleFonts.encodeSans(
                color: PokeColors.red2,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SearchField(),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(right: 50, bottom: 10),
            child: Text(
              'A Pokédex contém estatísticas detalhadas para cada criatura dos jogos Pokémon',
              style: GoogleFonts.encodeSans(
                color: PokeColors.grey3,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TripleBuilder<PokeListStore, Exception, List<PokemonInfoModel>>(
              store: store,
              builder: (context, triple) {
                return Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    slivers: [
                      if (triple.isLoading)
                        const SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (!triple.isLoading)
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return _listItem(triple.state[index]);
                          }, childCount: triple.state.length),
                        ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _listItem(PokemonInfoModel pokemon) {
    return Column(
      children: [
        PokemonCard(
          onTap: () => Modular.to.pushNamed('/poke-info',arguments: pokemon),
          image: pokemon.thumbnailImage,
          name: pokemon.name,
          number: pokemon.number,
          types: pokemon.type,
        ),
      ],
    );
  }
}
