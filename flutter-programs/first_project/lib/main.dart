import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void answerChoice() {
    print("Button is clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sample AppBar"),
        ),
        body: Column(
          children:  [
            Text("First Line"),
            ElevatedButton(
              onPressed: (){
                print("Button 1 clicked");
              },
              child: Text("Answer 1"),
            ),
            ElevatedButton(
              onPressed: (){
                print("Button 2 clicked");
              },
              child: Text("Answer 2"),
            ),
            ElevatedButton(
              onPressed: (){
                print("Button 3 clicked");

              },
              child: Text("Answer 3"),
            )
          ],
        ),
      ),
    );
  }
}
