class BreedModel {
  final String id;
  final String name;
  final String origin;
  final int intelligence;
  final String? imageUrl;
  final String? description;
  final int? adaptability;
  final String? lifeSpan;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? grooming;
  final int? healthIssues;
  final int? socialNeeds;
  final int? strangerFriendly;
  final String? temperament;
  final String? wikipediaUrl;

  BreedModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.intelligence,
    this.imageUrl,
    this.description,
    this.adaptability,
    this.lifeSpan,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.socialNeeds,
    this.strangerFriendly,
    this.temperament,
    this.wikipediaUrl,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    String imageUrl =
        'https://cdn2.thecatapi.com/images/${json['reference_image_id']}.jpg';

    return BreedModel(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      intelligence: json['intelligence'],
      imageUrl: imageUrl,
      description: json['description'],
      adaptability: json['adaptability'],
      lifeSpan: json['life_span'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      temperament: json['temperament'],
      wikipediaUrl: json['wikipedia_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'origin': origin,
      'intelligence': intelligence,
      'imageUrl': imageUrl,
      'description': description,
      'adaptability': adaptability,
      'lifeSpan': lifeSpan,
      'affectionLevel': affectionLevel,
      'childFriendly': childFriendly,
      'dogFriendly': dogFriendly,
      'energyLevel': energyLevel,
      'grooming': grooming,
      'healthIssues': healthIssues,
      'socialNeeds': socialNeeds,
      'strangerFriendly': strangerFriendly,
      'temperament': temperament,
      'wikipediaUrl': wikipediaUrl,
    };
  }
}
