import 'package:flutter/material.dart';

void main()
{
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test 1'),),
      body: Column(
        children: [
          Text("I've got children"),
          Row(
            children: [
              ElevatedButton(onPressed: (){}, child: Text('Here')),
              ElevatedButton(onPressed: (){}, child: Text('No Here'))
            ],

          ),
          ListTile(title: Text('Hey I am here'),)
        ],
      ),
    );
  }
}
