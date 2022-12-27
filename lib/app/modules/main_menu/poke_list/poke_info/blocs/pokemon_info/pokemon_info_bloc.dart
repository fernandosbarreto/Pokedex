import 'dart:async';

import 'package:pokedex/app/core/interfaces/pokemon_repository_interface.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/store/poke_store.dart';

import 'pokemon_info_events.dart';
import 'pokemon_info_state.dart';

class PokemonInfoBloc {
  final IPokemonRepository _pokemonRepository;
  final PokeStore _store;

  PokemonInfoBloc(this._pokemonRepository, this._store) {
    _inputPokemonInfoController.stream.listen(_mapEventToState);
  }

  final StreamController<PokemonInfoEvent> _inputPokemonInfoController =
      StreamController<PokemonInfoEvent>.broadcast();
  final StreamController<PokemonInfoState> _outputPokemonInfoController =
      StreamController<PokemonInfoState>.broadcast();

  Sink<PokemonInfoEvent> get inputPokemonInfo =>
      _inputPokemonInfoController.sink;
  Stream<PokemonInfoState> get stream => _outputPokemonInfoController.stream;

  _mapEventToState(PokemonInfoEvent event) async {
    PokemonInfoState pokemons = const PokemonInfoNone();

    if (event is LoadPokemonInfoEvent) {
      _outputPokemonInfoController.add(const PokemonInfoLoading());
      pokemons = await _pokemonRepository.getOnePokemon(
          pokemonId: int.parse(_store.pokemonInfoModel?.number ?? ''));
    }
    _outputPokemonInfoController.add(pokemons);
  }
}
