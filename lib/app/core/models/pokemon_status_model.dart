import 'package:pokedex/app/core/models/status_model.dart';

class PokemonDetailsModel {
  final List<StatusModel> stats;

  PokemonDetailsModel({required this.stats});

  factory PokemonDetailsModel.fromJson(Map json) {
    return PokemonDetailsModel(
      stats: (json['stats'] as List<dynamic>)
          .map((e) => StatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
