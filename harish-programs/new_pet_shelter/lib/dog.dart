//TOD0: Implement an image.

class Dog {
  final int id;
  final String breed;
  final int age;
  final double weight;
  final String name;

  Dog(
      {required this.id,
      required this.name,
      required this.breed,
      required this.age,
      required this.weight});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'breed': breed,
      'weight': weight,
    };
  }

  @override
  String toString() {
    return 'Dog {id: $id, name: $name, age: $age, breed: $breed, weight: $weight}';
  }
}
