import 'package:flutter/material.dart';
import 'package:sign_up_screen/homepage.dart';

void main() {
  runApp(MaterialApp(
    title: "Navigation",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

void signIn(){}

class _MyAppState extends State<MyApp> {

  //Create a controller

  final myController = TextEditingController();

// Needs a method to dispose it.
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login"),),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Enter Your Name",
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                ElevatedButton(onPressed: (){

                  print(myController.text);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>  HomePage()));

                  }, child: Text("Sign In"))
              ],
            ),
          ),
        ),
    );
  }
}
