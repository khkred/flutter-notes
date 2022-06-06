import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_firebase/screens/list_pets.dart';
import 'package:pet_firebase/screens/pet_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'models/pet.dart';
import 'screens/add_pet.dart';
import 'screens/home_screen.dart';

void main() async {
  //Ensure that all the widgets are binding before running the firebase app
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

List<Pet> petList = [];

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final screenOptions = [
    HomeScreen(auth: auth, user: user),
  ];

  void addPets(pet) {
    setState(() {
      petList.add(pet);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicUserValidation(),
    );
  }
}

// Within the `FirstRoute` widget
