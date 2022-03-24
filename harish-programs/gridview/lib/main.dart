import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var imageChanger = List<String>.generate(20, (index) => 'images/poster${index}.jpg');
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View App"),
      ),
      body: ListView(
        children: [
          Image.asset(imageChanger[index]),
          ElevatedButton(onPressed: (){
            if(index < 20){
              index++;
            }
            else{
              index = 0;
            }
          }, child: Text("Click me to change the poster!"))
        ],
      ),
    );
  }
}
