import 'dart:convert';
import 'package:flutter/material.dart';
import 'download.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> getAppJson() async{
    String response = await Download().getResponseFromApi();

    var nameListJson = jsonDecode(response);

    print(nameListJson["name"]);
  }

  @override
  Widget build(BuildContext context) {
    getAppJson();
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}
