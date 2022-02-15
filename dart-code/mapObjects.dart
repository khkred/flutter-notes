void main() {
  //Completed 1: Create an arrayList of type Person, with 10 objects.

  List peopleList = [
    Person("Aarav", 14),
    Person("Michael", 8),
    Person("Franklin", 8),
    Person("Trevor", 8),
    Person("CJ", 17),
    Person("Kratos", 23),
    Person("Jasmine", 14),
    Person("David", 14),
    Person("Steve", 12),
    Person("Jay", 10),
    Person("Kai", 10),
    Person("Mikey", 30),
  ];

  //TODO 2: Using the map method print the name of the person using print()

//   for(var person in peopleList)
//   {
//     print(person.name);
//   }

  var namesList = peopleList.map((person) {
    return person.name;
  }).toList();

  print(namesList);
}

class Person {
  String name;
  int age;
  Person(this.name, this.age);
}
