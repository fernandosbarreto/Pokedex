import 'package:pokedex/app/core/models/details_type_model.dart';

class GeneraModel {
  final String genus;
  final DetailsTypeModel language;

  GeneraModel({
    required this.genus,
    required this.language,
  });

  factory GeneraModel.fromJson(Map<String, dynamic> json) {
    return GeneraModel(
      genus: json['genus'],
      language: DetailsTypeModel.fromJson(json['language']),
    );
  }
}
