import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  //generate 10 persons

  var persons = List<String>.generate(20, (index) => 'person ${index+1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View'),),
      body: Column(
        children: [
          Text('Here is the List'),

          Container(
            height: 500,
            child: ListView(
              children: persons.map((item) => ListTile(title: Text(item),)).toList(),
            ),
          )
        ],
      ),
    );

  }
}
