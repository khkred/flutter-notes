import 'package:flutter/material.dart';
import 'dog.dart';
import 'dog_form.dart';
import 'dog_list.dart';
void main() {

  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );

}

class MyApp extends StatelessWidget {

  var dogList = [
    Dog(Name: 'Rover', Breed: 'German Shepherd', Age: 8, Weight: 5),
    Dog(Name: 'Lassie', Breed: 'German Shepherd', Age: 6, Weight: 8),
    Dog(Name: 'Chop', Breed: 'Rottweiler', Age: 8, Weight: 10)
  ];

  void addNewDog(BuildContext context) {
    //Show Modal Bottom Sheet is a inbuilt widget defined by flutter.
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: DogForm(addDogs),
            onTap: (){},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void addDogs(dog){
    dogList.add(dog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
        title: Text('Dogs'),
      ),  

      body: Column(
        children: [DogWidgetList(dogList)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewDog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
