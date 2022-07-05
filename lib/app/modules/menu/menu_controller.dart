import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';
import 'package:pokedex/app/core/models/sprites_model.dart';
import 'package:pokedex/app/core/repositories/pokemon_repository.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';

class MenuController extends NotifierStore<Exception, int> {
  final PokemonRepository _pokemonRepository;

  MenuController(this._pokemonRepository) : super(0);

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
  final cardLabels = [
    'Pokedex',
    'Movimentos',
    'Habilidades',
    'Items',
    'Locais',
    'Type charts',
  ];

  final cardRoutes = [
    () => Modular.to.pushNamed('/poke-list/'),
    // () => Modular.to.pushNamed('/movements/'),
    // () => Modular.to.pushNamed('/skills/'),
    // () => Modular.to.pushNamed('/items/'),
    // () => Modular.to.pushNamed('/locations/'),
    // () => Modular.to.pushNamed('/type-charts/'),
    () => debugPrint('b'),
    () => debugPrint('c'),
    () => debugPrint('d'),
    () => debugPrint('e'),
    () => debugPrint('f'),
  ];

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    int value = state + 1;
    update(value);
    pokemon = await _pokemonRepository.fetchOnePokemon(pokemonId: value);
    // if (value < 5) {
    //   update(value);
    // } else {
    //   setError(Exception('Error: state not can be > 4'));
    // }

    setLoading(false);
  }

  String get pokemonSprite => pokemon.sprites.frontDefault;
}
