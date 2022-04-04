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

  //TODO 3: Call a late variable of type String, to store the book name

  // Get JSOn OBJECT

  Future<void> getBookJson() async {
    String response = await BookDownload().getResponseFromApi();


    var bookListJson = jsonDecode("bookList");
    // Convert response to a JSON Object

    var responseJsonObject = jsonDecode(response);

    var jsonBooksArrayList = responseJsonObject["bookList"];

    //TODO 1: Get the first Book Object
    //TODO 2: Store the name of the book and return it


  }

  @override
  Widget build(BuildContext context) {

    //TODO 4: Assign the book name from the method to the late variable
    return Center(
      //TODO 5: Use a Future Builder to print the book name in a Text Widget
    );
  }
}
