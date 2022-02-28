import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );


}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Buttons'),
        actions: [IconButton(onPressed: (){
          print("Plus button clicked");
        }, icon: Icon(Icons.add))],
      ),

      body: Center(
        child: Text("Sample Menu App"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
