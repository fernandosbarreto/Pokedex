class DetailsTypeModel {
  final String name;

  DetailsTypeModel({
    required this.name,
  });

  factory DetailsTypeModel.fromJson(Map<String, dynamic> json) {
    return DetailsTypeModel(
      name: json['name'],
    );
  }
}
