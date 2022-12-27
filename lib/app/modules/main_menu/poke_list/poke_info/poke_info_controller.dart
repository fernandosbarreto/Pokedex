import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_detail/pokemon_detail_event.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_info/pokemon_info_bloc.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_info/pokemon_info_events.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/store/poke_store.dart';

class PokeInfoController {
  final PokeStore pokeStore;
  final PokemonInfoBloc pokemonInfoBloc;
  final PokemonDetailBloc pokemonDetailBloc;

  PokeInfoController(
    this.pokeStore,
    this.pokemonInfoBloc,
    this.pokemonDetailBloc,
  );

  void onInit() {
    pokemonInfoBloc.inputPokemonInfo.add(LoadPokemonInfoEvent());
    pokemonDetailBloc.inputPokemonDetail.add(LoadPokemonDetailEvent());
  }
}
