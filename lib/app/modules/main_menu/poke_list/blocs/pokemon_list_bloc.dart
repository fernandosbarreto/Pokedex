import 'dart:async';

import 'package:pokedex/app/core/interfaces/pokemon_repository_interface.dart';

import 'pokemon_list_events.dart';
import 'pokemon_list_state.dart';

class PokemonListBloc {
  final IPokemonRepository _pokemonRepository;

  PokemonListBloc(this._pokemonRepository) {
    _inputPokemonListController.stream.listen(_mapEventToState);
  }

  final StreamController<PokemonListEvent> _inputPokemonListController =
      StreamController<PokemonListEvent>.broadcast();
  final StreamController<PokemonListState> _outputPokemonListController =
      StreamController<PokemonListState>.broadcast();

  Sink<PokemonListEvent> get inputPokemonList =>
      _inputPokemonListController.sink;
  Stream<PokemonListState> get stream => _outputPokemonListController.stream;

  _mapEventToState(PokemonListEvent event) async {
    PokemonListState pokemons = const PokemonListNone();

    if (event is LoadPokemonListEvent) {
      _outputPokemonListController.add(const PokemonListLoading());
      pokemons = await _pokemonRepository.getAllPokemon();
    }
    _outputPokemonListController.add(pokemons);
  }
}
