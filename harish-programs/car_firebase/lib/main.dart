import 'package:car_firebase/screens/dynamic_user_validation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:car_firebase/screens/home_screen.dart';

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

class _MyAppState extends State<MyApp> {

  final screenOptions = [
    HomeScreen(auth: auth, user: user),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicUserValidation(),
    );
  }
}