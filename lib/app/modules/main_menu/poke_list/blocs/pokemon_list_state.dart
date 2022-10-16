import '../../../../core/models/pokemon_info_model.dart';

abstract class PokemonListState {}

class PokemonListData implements PokemonListState {
  final List<PokemonInfoModel> data;

  const PokemonListData(this.data);
}

class PokemonListError implements PokemonListState {
  final String message;

  const PokemonListError(this.message);
}

class PokemonListLoading implements PokemonListState {
  const PokemonListLoading();
}

class PokemonListNone implements PokemonListState {
  const PokemonListNone();
}
