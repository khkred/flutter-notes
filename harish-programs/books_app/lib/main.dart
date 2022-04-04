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
  // Get JSOn OBJECT

  Future<void> getBookJson() async {
    String response = await BookDownload().getResponseFromApi();

<<<<<<< HEAD

    var bookListJson = jsonDecode("bookList");
    // Convert response to a JSON Object

    var responseJsonObject = jsonDecode(response);

    var jsonBooksArrayList = responseJsonObject["bookList"];

    print(jsonBooksArrayList);


>>>>>>> 34c5480f487e398d5773413fed2217095ef21255


  }

  @override
  Widget build(BuildContext context) {
    getBookJson();
    return Center();
  }
}
