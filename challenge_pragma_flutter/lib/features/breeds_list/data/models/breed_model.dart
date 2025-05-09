class BreedModel {
  final String id;
  final String name;
  final String origin;
  final int intelligence;
  final String? imageUrl;

  BreedModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.intelligence,
    this.imageUrl,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      intelligence: json['intelligence'],
      imageUrl: json['image'] != null ? json['image']['url'] : null,
    );
  }
}
