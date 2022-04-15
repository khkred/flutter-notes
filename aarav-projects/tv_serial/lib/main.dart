import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tv_serial/model/tv.dart';

import 'tv_network.dart';
import 'model/tv.dart';

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
  late Future<List<Tv>> tvEpisode;

  var i = 0;

  List<String> tvUrl = [
    "https://api.themoviedb.org/3/trending/tv/day?"
  ];

  Future<List<Tv>> getEpisode() async {
    var response = await Download(tvUrl[i]).getResponseFromApi();
    var responseJsonObject = jsonDecode(response);
    var results = responseJsonObject["results"];
    var tv1 = results[0];
    var poster = tv1["poster_path"];
    return results.map<Tv>((json) => Tv.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    tvEpisode = getEpisode();

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
              onSelected: (int index) {
                setState(() {
                  i = index;
                });
              }),
        ],
      ),
      body: FutureBuilder<List<Tv>>(
           future: tvEpisode,
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
