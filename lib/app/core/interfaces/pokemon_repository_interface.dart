import 'package:pokedex/app/modules/main_menu/poke_list/blocs/pokemon_list_state.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_detail/pokemon_detail_state.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_info/pokemon_info_state.dart';

abstract class IPokemonRepository {
  Future<PokemonInfoState> getOnePokemon({required int pokemonId});
  Future<PokemonListState> getAllPokemon();
  Future<PokemonDetailState> getPokemonStatus({required int pokemonId});
}
