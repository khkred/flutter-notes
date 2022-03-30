class Greeting
{
  final String name;
  final int age;
  final String occupation;

  Greeting(this.name,this.age,this.occupation);

  @override
  String toString() {


    return 'Your name is $name, Your age is $age and you are a $occupation';
  }
}