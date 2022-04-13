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
  late Future<List<Movie>> movie;

  var i = 0;

  List<String> movieUrl = ["https://api.themoviedb.org/3/movie/popular?", "https://api.themoviedb.org/3/trending/movie/day?"];

  Future<List<Movie>> getMovie() async {
    var response = await Download(movieUrl[i]).getResponseFromApi();
    var responseJsonObject = jsonDecode(response);
    var results = responseJsonObject["results"];
    var movie1 = results[0];
    var poster = movie1["poster_path"];
    return results.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    movie = getMovie();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: 0,
                        child: Text(
                          "Popular",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                    const PopupMenuItem(
                        value: 1,
                        child: Text(
                          "Trending",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                  onSelected:(int index) {
                setState(() {
                  i = index;
                });
              }
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
          future: movie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Image.network(snapshot.data![index].posterUrl());
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
