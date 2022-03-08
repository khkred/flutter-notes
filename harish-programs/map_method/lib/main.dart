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

  // file 1 file 2 file 3
  var fileList = List<String>.generate(5, (index) => 'file : ${index+1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Method'),
      ),
      body: Column(
        children: fileList.map((item) => ListTile(
          title: Text(item),
          tileColor: Colors.red,
        )).toList(),
      ),
    );

  }
}
