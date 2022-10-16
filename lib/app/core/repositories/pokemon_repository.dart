import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/app/core/interfaces/pokemon_repository_interface.dart';
import 'package:pokedex/app/core/models/pokemon_info_model.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';

class PokemonRepository extends IPokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  @override
  Future<PokemonModel> fetchOnePokemon({required int pokemonId}) async {
    final url = 'https://pokeapi.co/api/v2/pokemon/$pokemonId';

    try {
      final response = await dio.get(url);
      final pokemon = PokemonModel.fromJson(response.data);
      return pokemon;
    } catch (e) {
      throw Exception(
          'Não foi possivel buscar os dados do Pokemon N° $pokemonId');
    }
  }

  @override
  Future<List<PokemonInfoModel>> fetchAllPokemon() async {
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
      return pokemons;
    } catch (e) {
      throw Exception('Não foi possivel buscar os Pokemons');
    }
  }
}
