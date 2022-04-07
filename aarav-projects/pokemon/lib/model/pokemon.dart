
class Pokemon{
  String name;
  String power;

  Pokemon({required this.name, required this.power});

  factory Pokemon.fromJson(Map<String, dynamic> pokemon_json) => Pokemon(
    name: pokemon_json["name"],
    power: pokemon_json["power"]
  );
}