import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This method will display the bottom sheet

  void showBottom(BuildContext context)
  {
    showModalBottomSheet(context: context, builder: (builderContext){
      return Container(
          height: 300,
          child: Text('This is the modal sheet'));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test 3'),),
      body: Center(
        child: ElevatedButton(onPressed: showBottom(context),
          child: Text('Show Bottom Sheet'),),
      ),
    );
  }
}
