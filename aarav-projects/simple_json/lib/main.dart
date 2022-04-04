import 'dart:convert';

import 'package:flutter/material.dart';

import 'download.dart';

void main() {
  runApp( MaterialApp(
    home: MyApp(),
  ));
}


class _MyAppState extends State<MyApp> {

  //late variable that stores the name
  late Future<String> name;



  Future<String> getNameFromApi() async
  {
    var response = await Download().getResponseFromApi();
    var responseJsonObject = jsonDecode(response);
    var name = responseJsonObject["name"];

    return name;
  }

  @override
  Widget build(BuildContext context) {
    name = getNameFromApi();


    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: name,
          builder: (context,snapshot) {

            if(snapshot.hasData) {
              return Text(snapshot.data!);
            }
            else if(snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();

          },

        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
