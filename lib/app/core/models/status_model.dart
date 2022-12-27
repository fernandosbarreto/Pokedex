import 'package:pokedex/app/core/models/details_type_model.dart';

class StatusModel {
  final int baseStat;
  final int effort;
  final DetailsTypeModel stat;

  StatusModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatusModel.fromJson(Map json) {
    return StatusModel(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: DetailsTypeModel.fromJson(json['stat'] as Map<String, dynamic>),
    );
  }
}
