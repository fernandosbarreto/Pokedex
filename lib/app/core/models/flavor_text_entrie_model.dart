import 'package:pokedex/app/core/models/details_type_model.dart';

class FlavorTextEntrieModel {
  final String flavorText;
  final DetailsTypeModel language;

  FlavorTextEntrieModel({
    required this.flavorText,
    required this.language,
  });

  factory FlavorTextEntrieModel.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntrieModel(
      flavorText: json['flavor_text'],
      language: DetailsTypeModel.fromJson(json['language']),
    );
  }
}
