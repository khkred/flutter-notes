import 'package:flutter/material.dart';

import 'book_download.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home:  Scaffold(
      appBar: AppBar(title: const Text('books'),),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Show Books'),
        onPressed: () {
          BookDownload().getResponseFromApi();
        },
      ),
    );
  }
}
