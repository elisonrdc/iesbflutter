class Character {

  int id;
  String name;
  String image;
  String status;
  String species;
  String type;
  String gender;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
    );
  }
}