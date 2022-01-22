import 'package:flutter_triple/flutter_triple.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';
import 'package:pokedex/app/core/models/sprites_model.dart';
import 'package:pokedex/app/core/repositories/pokemon_repository.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';

class PokeListController {
  final PokemonRepository _pokemonRepository;

  PokeListController(this._pokemonRepository) {
    onInit();
  }

  final _pokemon = RxNotifier<PokemonModel>(
    PokemonModel(
      sprites: SpritesModel(
        backDefault: '',
        frontDefault: '',
      ),
    ),
  );
  PokemonModel get pokemon => _pokemon.value;
  set pokemon(PokemonModel value) => _pokemon.value = value;

  final cardColors = [
    PokeColors.green1,
    PokeColors.red1,
    PokeColors.blue1,
    PokeColors.yellow1,
    PokeColors.purple1,
    PokeColors.brown1,
  ];

  Future<void> onInit() async {
    pokemon = await _pokemonRepository.featchPokemon(pokemonId: 6);
  }

  String get pokemonSprite => pokemon.sprites.frontDefault;
}
