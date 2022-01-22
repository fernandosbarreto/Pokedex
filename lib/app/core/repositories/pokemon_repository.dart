import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/app/core/models/pokemon_model.dart';

class PokemonRepository {
  Future<PokemonModel> featchPokemon({required int pokemonId}) async {
    final _url = 'https://pokeapi.co/api/v2/pokemon/$pokemonId';

    final response = await http.get(Uri.parse(_url));
    final pokemon = PokemonModel.fromJson(jsonDecode(response.body));
    return pokemon;

    // try {

    //   // final ad = AdsModel.fromJson(response.body as Map<String, dynamic>);

    //   // return Ad.data(ad);
    // } on Error catch (e, _) {
    //   print(e);
    //   // crashlytics.recordError(e, s, reason: httpService.errorReason(e));
    // } catch (e, _) {
    //   print(e);
    //   // crashlytics.recordError(e, s);
    // }
    // return Error();
    // return const Ad.error();
  }

  // Future<List<PokemonModel>> featchAllPokemon() async {
  //   const _url = 'https://api.pokemon.com/br/api/pokedex/galar';

  // }
}
