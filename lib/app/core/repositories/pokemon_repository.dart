import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/app/core/models/pokemon_info_model.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';

class PokemonRepository {
  final dio = Dio();
  Future<PokemonModel> fetchOnePokemon({required int pokemonId}) async {
    final _url = 'https://pokeapi.co/api/v2/pokemon/$pokemonId';

    try {
      final response = await dio.get(_url);
      final pokemon = PokemonModel.fromJson(response.data);
      return pokemon;
    } catch (e) {
      throw Exception(
          'Não foi possivel buscar os dados do Pokemon N° $pokemonId');
    }
  }

  Future<List<PokemonInfoModel>> fetchAllPokemon() async {
    const _url = 'https://api.pokemon.com/br/api/pokedex/galar';

    try {
      final response = await dio.get(_url);
      final pokeInfoList = response.data as List;
      List<PokemonInfoModel> pokemons = [];

      //TODO: make a helper to it
      for (var item in pokeInfoList) {
        final pokeInfo = PokemonInfoModel.fromJson(item);
        if (pokemons.any((element) => element.number == pokeInfo.number)) {
          debugPrint('${pokeInfo.number} repetido');
        } else {
          pokemons.add(pokeInfo);
        }
      }
      return pokemons;
    } catch (e) {
      throw Exception('Não foi possivel buscar os Pokemons');
    }
  }
}
