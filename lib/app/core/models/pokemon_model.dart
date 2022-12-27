import 'package:pokedex/app/core/models/flavor_text_entrie_model.dart';
import 'package:pokedex/app/core/models/genera_model.dart';

class PokemonModel {
  final List<FlavorTextEntrieModel> flavorTextEntries;
  final List<GeneraModel> genera;

  PokemonModel({
    required this.flavorTextEntries,
    required this.genera,
  });

  factory PokemonModel.fromJson(Map json) {
    return PokemonModel(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntrieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => GeneraModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
