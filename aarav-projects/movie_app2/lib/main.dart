import 'dart:convert';

import 'package:flutter/material.dart';

import 'movie_network.dart';
import 'model/movie.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Movie> movie;

  Future<Movie> getMovie() async {
    var response = await Download().getResponseFromApi();
    var responseJsonObject = jsonDecode(response);
    var title = responseJsonObject["title"];

    return Movie.fromJson(responseJsonObject);
  }

  @override
  Widget build(BuildContext context) {
    movie = getMovie();

    return Scaffold(
      body: FutureBuilder<Movie>(
          future: movie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  Image.network(snapshot.data!.poster),
                  Text(snapshot.data!.name),
                  Text(snapshot.data!.overview)
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
