import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var imageChanger = 'images/franklin.jpg';
  var images = ['images/franklin.jpg','images/lester.png','images/michael.png','images/trevor.jpg'];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images"),
      ),
      body:  ListView(
        children: [
          Image.asset(images[index]),
          ElevatedButton(onPressed: (){setState(() {
            if(index < 3){
              index++;
            }
            else{
              index = 0;
            }
          });}, child: Text("Click me to change the image"))
        ],
      ),
    );
  }
}
