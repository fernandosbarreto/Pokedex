import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/app/core/models/pokemon_info_model.dart';
import 'package:pokedex/app/core/models/pokemon_model.dart';

class PokemonRepository {
  Future<PokemonModel> fetchOnePokemon({required int pokemonId}) async {
    final _url = 'https://pokeapi.co/api/v2/pokemon/$pokemonId';

    try {
      final response = await http.get(Uri.parse(_url));
      final pokemon = PokemonModel.fromJson(jsonDecode(response.body));
      return pokemon;
    } catch (e) {
      throw Exception(
          'Não foi possivel buscar os dados do Pokemon N° $pokemonId');
    }
  }

  Future<PokemonInfoModel> fetchAllPokemon() async {
    const _url = 'https://api.pokemon.com/br/api/pokedex/galar';
    final response = await http.get(Uri.parse(_url));
    var json = jsonDecode(response.body);
    var pokeInfo = PokemonInfoModel.fromJson(json[0]);
    return pokeInfo;
  }
}
