import 'package:pokedex/app/core/models/sprites_model.dart';

class PokemonModel {
  final SpritesModel sprites;

  PokemonModel({required this.sprites});

  factory PokemonModel.fromJson(Map json) {
    return PokemonModel(
      sprites: SpritesModel.fromJson(json['sprites']),
    );
  }

}
