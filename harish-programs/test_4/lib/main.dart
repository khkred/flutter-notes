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
      appBar: AppBar(title: Text('test 4'),),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter a word'
            ),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'No. of Tiles ?',

            ),
            keyboardType: TextInputType.number,

          ),
          ElevatedButton(onPressed: (){}, child: Text('Generate List Tiles'))
        ],
      ),
    );
  }
}
