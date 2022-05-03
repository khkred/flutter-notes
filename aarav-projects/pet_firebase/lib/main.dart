import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/add_pet.dart';


void main() async{

  //Ensure that all the widgets are binding before running the firebase app
  WidgetsFlutterBinding.ensureInitialized();

  //Getting Firebase Instance in our app
  await Firebase.initializeApp();

  runApp( MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AddPetScreen()
    );
  }
}
