import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/modules/menu/poke_list/blocs/pokemon_list_events.dart';

import '../../../core/models/pokemon_info_model.dart';
import '../../../core/utils/poke_colors.dart';
import '../../../core/widgets/cards/pokemon_card.dart';
import '../../../core/widgets/fields/search_field.dart';
import 'blocs/pokemon_list_state.dart';
import 'poke_list_controller.dart';

class NewPokeListPage extends StatefulWidget {
  const NewPokeListPage({Key? key}) : super(key: key);

  @override
  _NewPokeListPageState createState() => _NewPokeListPageState();
}

class _NewPokeListPageState extends State<NewPokeListPage> {
  final controller = Modular.get<PokeListController>();

  @override
  void initState() {
    super.initState();
    controller.pokemonListBloc.inputPokemonList.add(LoadPokemonListEvent());
  }

  @override
  void dispose() {
    controller.pokemonListBloc.inputPokemonList.close();
    super.dispose();
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
          StreamBuilder<PokemonListState>(
            stream: controller.pokemonListBloc.stream,
            builder: (context, AsyncSnapshot<PokemonListState> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }
              var state = snapshot.data;

              if (state is PokemonListError) {
                return Text(snapshot.error.toString());
              }
              if (state is PokemonListLoading) {
                return const Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                );
              }
              state = state as PokemonListData;
              var list = state.data;

              return Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _listItem(list[index]),
                        childCount: state.data.length,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _listItem(PokemonInfoModel pokemon) {
    return Column(
      children: [
        PokemonCard(
          onTap: () => Modular.to.pushNamed('poke-info/', arguments: pokemon),
          image: pokemon.thumbnailImage,
          name: pokemon.name,
          number: pokemon.number,
          types: pokemon.type,
        ),
      ],
    );
  }
}
