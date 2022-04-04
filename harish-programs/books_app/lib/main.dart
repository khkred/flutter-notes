import 'dart:convert';

import 'package:flutter/material.dart';

import 'book_download.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('books'),
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //Completed 3: Call a late variable of type String, to store the book name

  late Future<String> name;

  // Get JSOn OBJECT

  Future<String> getBookJson() async {
    String response = await BookDownload().getResponseFromApi();


    // Convert response to a JSON Object
    var responseJsonObject = jsonDecode(response);

    var jsonBooksArrayList = responseJsonObject["bookList"];

    //Completed 1: Get the first Book Object Completed

    var book = jsonBooksArrayList[0];

    //Completed 2: Store the name of the book and return it
    var title = book["name"];

    return title;
  }

  @override
  Widget build(BuildContext context) {

    //Completed 4: Assign the book name from the method to the late variable

    name = getBookJson();

    return Center(

      //TODO 5: Use a Future Builder to print the book name in a Text Widget

      child: FutureBuilder<String>(
        future: name,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text(snapshot.data!);
          }
          else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),

    );
  }
}
