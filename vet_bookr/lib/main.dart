import 'package:vet_bookr/screens/symptoms.dart';

import '/screens/dynamic_user_validation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vet_bookr/screens/home_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() async {
  //Ensure that all the widgets are binding before running the firebase app
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final screenOptions = [
  HomeScreen, Symptoms("")
];

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicUserValidation(),
      bottomNavigationBar: SalomonBottomBar(items: [
        SalomonBottomBarItem(icon: const Icon(Icons.home), title: Text("Home")),
        SalomonBottomBarItem(icon: const Icon(Icons.add_chart), title: Text("Clinics"))
      ],

      ),
    );
  }
}