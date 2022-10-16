import 'package:pokedex/app/core/helpers/format_helper.dart';

class PokemonInfoModel {
  final List<String> abilities;
  final List<String> weakness;
  final List<String> type;
  final String detailPageUrl;
  final double weight;
  final String number;
  final double height;
  final String name;
  final String thumbnailImage;

  PokemonInfoModel({
    required this.abilities,
    required this.detailPageUrl,
    required this.thumbnailImage,
    required this.name,
    required this.weight,
    required this.weakness,
    required this.number,
    required this.height,
    required this.type,
  });

  factory PokemonInfoModel.fromJson(Map json) {
    return PokemonInfoModel(
      abilities: FormatHelper.valueToStringList(json['abilities']),
      weakness: FormatHelper.valueToStringList(json['weakness']),
      type: FormatHelper.valueToStringList(json['type']),
      detailPageUrl: json['detailPageURL'],
      thumbnailImage: json['ThumbnailImage'],
      name: json['name'],
      weight: json['weight'],
      number: json['number'],
      height: json['height'],
    );
  }
}
