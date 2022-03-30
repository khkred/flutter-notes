class NamedGreeting {
  final String name;
  final int age;
  final String occupation;

  NamedGreeting({required this.name, required this.age, required this.occupation});
  @override
  String toString() {
    return 'Your name is $name, Your age is $age and you are a $occupation';
  }
}
