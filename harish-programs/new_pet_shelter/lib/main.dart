import 'package:flutter/material.dart';
import 'dog.dart';
import 'dog_form.dart';
import 'dog_list.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, breed TEXT, weight REAL)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );

}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dogList = [
    Dog(name: 'Rover', breed: 'German Shepherd', age: 8, weight: 5),
    Dog(name: 'Lassie', breed: 'German Shepherd', age: 6, weight: 8),
    Dog(name: 'Chop', breed: 'Rottweiler', age: 8, weight: 10)
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
    setState(() {
      dogList.add(dog);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
        title: Text('Dogs'),
      ),

      body: DogWidgetList(dogList),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewDog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
