import 'package:pokedex/app/modules/main_menu/poke_list/store/poke_store.dart';

import 'blocs/pokemon_list_bloc.dart';

class PokeListController {
  final PokemonListBloc pokemonListBloc;
  final PokeStore store;
  PokeListController(this.pokemonListBloc, this.store);
}
