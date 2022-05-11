

class Character {
  final String name;
  final int age;
  final String skills;
  final String game;
  List<String> creationDate = [];

  Character({
    required this.name,
    required this.age,
    required this.skills,
    required this.game,
  });

  void addDate(String creationDates) {
    creationDate.add(creationDates);
  }

  factory Character.fromJson(Map<String, dynamic> characterJson, {characterName}) => Character(
    name: characterJson["characterName"],
    age: characterJson["characterAge"],
    skills: characterJson["characterSkills"],
    game: characterJson["inGame"],
  );

  List<String> getCreationDate(Map<String, dynamic> characterJson) =>
      characterJson["creationDate"];
}
