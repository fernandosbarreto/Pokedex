import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/app/core/constants/base_url.dart';
import 'package:pokedex/app/core/interfaces/pokemon_repository_interface.dart';
import 'package:pokedex/app/core/models/pokemon_info_model.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';
import 'package:pokedex/app/core/models/pokemon_status_model.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/blocs/pokemon_list_state.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_detail/pokemon_detail_state.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_info/pokemon_info_state.dart';

class PokemonRepository extends IPokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  @override
  Future<PokemonInfoState> getOnePokemon({required int pokemonId}) async {
    final url = '${BaseUrl.path}pokemon-species/$pokemonId';

    try {
      final response = await dio.get(url);
      final pokemon = PokemonModel.fromJson(response.data);
      return PokemonInfoData(pokemon);
    } on DioError catch (e, s) {
      return PokemonInfoError(e.message, s);
    }
  }

  @override
  Future<PokemonDetailState> getPokemonStatus({required int pokemonId}) async {
    final url = '${BaseUrl.path}pokemon/$pokemonId';

    try {
      final response = await dio.get(url);
      final pokemonDetail = PokemonDetailsModel.fromJson(response.data);
      return PokemonDetailData(pokemonDetail);
    } on DioError catch (e, s) {
      return PokemonDetailError(e.message, s);
    }
  }

  @override
  Future<PokemonListState> getAllPokemon() async {
    const url = 'https://api.pokemon.com/br/api/pokedex/galar';

    try {
      final response = await dio.get(url);
      final pokeInfoList = response.data as List;
      List<PokemonInfoModel> pokemons = [];

      List<PokemonInfoModel> repetedPokemons = [];

      for (var item in pokeInfoList) {
        final pokeInfo = PokemonInfoModel.fromJson(item);
        if (pokemons.any((element) => element.number == pokeInfo.number)) {
          repetedPokemons.add(pokeInfo);
        } else {
          pokemons.add(pokeInfo);
        }
      }
      debugPrint('${repetedPokemons.length} Pokémons repetidos');
      return PokemonListData(pokemons);
    } on DioError catch (e, s) {
      return PokemonListError(e.message, s);
    }
  }
}
