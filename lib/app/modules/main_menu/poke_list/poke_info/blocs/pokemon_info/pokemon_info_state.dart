import 'package:pokedex/app/core/models/pokemon_model.dart';

abstract class PokemonInfoState {}

class PokemonInfoData implements PokemonInfoState {
  final PokemonModel data;

  const PokemonInfoData(this.data);
}

class PokemonInfoError implements PokemonInfoState {
  final String message;
  final StackTrace stackTrace;

  const PokemonInfoError(this.message, this.stackTrace);
}

class PokemonInfoLoading implements PokemonInfoState {
  const PokemonInfoLoading();
}

class PokemonInfoNone implements PokemonInfoState {
  const PokemonInfoNone();
}
