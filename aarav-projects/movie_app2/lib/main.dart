import 'dart:convert';

import 'package:flutter/material.dart';

import 'movie_network.dart';
import 'model/movie.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget {
  late Future<Movie> movie;

  Future<Movie> getMovie() async{
    var response = await Download().getResponseFromApi();
    var responseJsonObject = jsonDecode(response);

    var movie = responseJsonObject["title"];

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ,
    );
  }
}
