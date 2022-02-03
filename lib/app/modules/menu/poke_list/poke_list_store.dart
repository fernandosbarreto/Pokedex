import 'package:flutter_triple/flutter_triple.dart';
import 'package:pokedex/app/core/models/pokemon_info_model.dart';
import 'package:pokedex/app/core/repositories/pokemon_repository.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';

class PokeListStore extends StreamStore<Exception, List<PokemonInfoModel>> {
  final PokemonRepository _pokemonRepository;

  PokeListStore(this._pokemonRepository) : super(<PokemonInfoModel>[]);

  final cardColors = [
    PokeColors.green1,
    PokeColors.red1,
    PokeColors.blue1,
    PokeColors.yellow1,
    PokeColors.purple1,
    PokeColors.brown1,
  ];

  Future<void> getPokemonList() async {
    try {
      setLoading(true);
      final pokemons = await _pokemonRepository.fetchAllPokemon();
      update(pokemons);
    } on Exception catch (ex, _) {
      setError(ex);
    } finally {
      setLoading(false);
    }
    await execute(() => _pokemonRepository.fetchAllPokemon());
  }
}
