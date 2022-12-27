import 'package:pokedex/app/core/interfaces/generic_state_interface.dart';
import 'package:pokedex/app/core/models/pokemon_status_model.dart';

abstract class PokemonDetailState {}

class PokemonDetailData with PokemonDetailState implements GenericStateData {
  @override
  final PokemonDetailsModel data;

  const PokemonDetailData(this.data);
}

class PokemonDetailError with PokemonDetailState implements GenericStateError {
  @override
  final String message;
  @override
  final StackTrace stackTrace;

  const PokemonDetailError(this.message, this.stackTrace);
}

class PokemonDetailLoading implements PokemonDetailState {
  const PokemonDetailLoading();
}

class PokemonDetailNone implements PokemonDetailState {
  const PokemonDetailNone();
}
