import 'dart:convert';

import 'package:books_app/model/book.dart';
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
  //Completed (2): Change the late variable datatype to get a Book Object (hint: you need to import book.dart)
  //  late Future<Book> name;

  late Future<List<Book>> booksList;

  // Get JSOn OBJECT

  //Completed (0): To see how to handle albums: https://docs.flutter.dev/cookbook/networking/fetch-data

  //Cpmpleted (1): Instead of returning just the "name", Return the Entire first book object
  Future<List<Book>> getBookJson() async {
    var response = await BookDownload().getResponseFromApi();
    // Convert response to a JSON Object
    var responseJsonObject = jsonDecode(response);

    var jsonBooksArrayList = responseJsonObject["bookList"];

    // var book = jsonBooksArrayList[0];
    
    //Convert Json ArrayList to Book Array List
    
    List<Book> booksArrayList = [];
    
    for(var jsonBook in jsonBooksArrayList) {
      
      booksArrayList.add(Book.fromJson(jsonBook));
    }
    

    return booksArrayList;
  }

  @override
  Widget build(BuildContext context) {
    booksList = getBookJson();

    return Center(
      //Completed (3): Use a Future Builder to create a column that has book name, title and the description

      child: FutureBuilder<List<Book>>(
        future: booksList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                children: snapshot.data!.map((book) => Row(
                      children: [Text(book.name), Text(book.author)],
                    )).toList());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
