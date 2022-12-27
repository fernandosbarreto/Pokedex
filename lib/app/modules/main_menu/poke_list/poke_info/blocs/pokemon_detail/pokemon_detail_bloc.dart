import 'dart:async';

import 'package:pokedex/app/core/interfaces/pokemon_repository_interface.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/store/poke_store.dart';

import 'pokemon_detail_event.dart';
import 'pokemon_detail_state.dart';

class PokemonDetailBloc {
  final IPokemonRepository _pokemonRepository;
  final PokeStore _store;

  PokemonDetailBloc(this._pokemonRepository, this._store) {
    _inputPokemonDetailController.stream.listen(_mapEventToState);
  }

  final StreamController<PokemonDetailEvent> _inputPokemonDetailController =
      StreamController<PokemonDetailEvent>.broadcast();
  final StreamController<PokemonDetailState> _outputPokemonDetailController =
      StreamController<PokemonDetailState>.broadcast();

  Sink<PokemonDetailEvent> get inputPokemonDetail =>
      _inputPokemonDetailController.sink;
  Stream<PokemonDetailState> get stream =>
      _outputPokemonDetailController.stream;

  _mapEventToState(PokemonDetailEvent event) async {
    PokemonDetailState pokemons = const PokemonDetailNone();

    if (event is LoadPokemonDetailEvent) {
      _outputPokemonDetailController.add(const PokemonDetailLoading());
      pokemons = await _pokemonRepository.getPokemonStatus(
          pokemonId: int.parse(_store.pokemonInfoModel?.number ?? ''));
    }
    _outputPokemonDetailController.add(pokemons);
  }
}
