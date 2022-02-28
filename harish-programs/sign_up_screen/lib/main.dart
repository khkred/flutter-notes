import 'package:flutter/material.dart';
import 'package:sign_up_screen/homepage.dart';
import 'credentials.dart';

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

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

// Needs a method to dispose it.
  @override
  void dispose() {
    myController1.dispose();
    super.dispose();
    myController2.dispose();
    super.dispose();
    myController3.dispose();
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
                  controller: myController1,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Enter Your Name",
                  ),
                ),
                TextFormField(
                  controller: myController2,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                TextField(
                  controller: myController3,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Your Age"
                  ),
                ),
                ElevatedButton(onPressed: (){

                  print(myController1.text);
                  print(myController2.text);
                  print(myController3.text);


                  Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>  HomePage(Credentials(myController1.text,myController2.text))));

                  }, child: Text("Sign In"))
              ],
            ),
          ),
        ),
    );
  }
}
