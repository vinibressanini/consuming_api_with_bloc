class CharacterModel {
  final int id;
  final String name;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }
}
