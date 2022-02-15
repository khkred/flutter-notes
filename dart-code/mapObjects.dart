void main() {
  //TODO 1: Create an arrayList of type Person, with 10 objects.
  final peopleList = const[
    Person["Aarav",14];
    Person["Michael",8];
    Person["Franklin",8];
    Person["Trevor",8];
    Person["CJ",17];
    Person["Kratos",4];
    Person["Jasmine",14];
    Person["David",14];
    Person["Steve",12];
    Person["Jay",10];
    Person["Kai",10];
    Person["Mikey",30];
  ]

  //TODO 2: Using the map method print the name of the person using print()

}

class Person {
  final List<Map<String,Object>> peopleList;

  String name;
  int age;
  Person(this.name, this.age);
}
