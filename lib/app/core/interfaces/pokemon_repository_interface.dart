import 'package:pokedex/app/core/models/pokemon_info_model.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<PokemonModel> fetchOnePokemon({required int pokemonId});
  Future<List<PokemonInfoModel>> fetchAllPokemon();
}
