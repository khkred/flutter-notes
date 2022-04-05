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

 //Todo(2): Change the late variable datatype to get a Book Object (hint: you need to import book.dart)
  late Future<String> name;

  // Get JSOn OBJECT

  //TODO(0): To see how to handle albums: https://docs.flutter.dev/cookbook/networking/fetch-data

  //TODO(1): Instead of returning just the "name", Return the Entire first book object
  Future<String> getBookJson() async {
    String response = await BookDownload().getResponseFromApi();


    // Convert response to a JSON Object
    var responseJsonObject = jsonDecode(response);

    var jsonBooksArrayList = responseJsonObject["bookList"];


    var book = jsonBooksArrayList[0];

    var title = book["name"];

    return title;
  }

  @override
  Widget build(BuildContext context) {

    name = getBookJson();

    return Center(

      //TODO(3): Use a Future Builder to create a column that has book name, title and the description

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
