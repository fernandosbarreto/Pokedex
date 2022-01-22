class SpritesModel {
  final String frontDefault;
  final String backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  SpritesModel({
    required this.backDefault,
    required this.frontDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory SpritesModel.fromJson(Map json) {
    return SpritesModel(
      backDefault: json['back_default'],
      frontDefault: json['front_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
    );
  }
}
